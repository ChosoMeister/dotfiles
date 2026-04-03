-- ⌥⌘V → click where to paste → types clipboard content character-by-character
-- Works in VMware / remote sessions; handles Persian, Arabic, emoji, and all Unicode.
-- Press Escape any time to cancel typing mid-way.

local focusDelay      = 0.15    -- seconds to wait after click before typing starts
local charDelay       = 0.02    -- seconds between each character (VNC-safe)
local alertTimeout    = 8       -- seconds the "click where…" prompt stays visible
local progressEvery   = 20      -- show progress every N characters

local clickTap   = nil
local cancelFlag = false
local escapeTap  = nil

-- Left Shift key code
local SHIFT_KEY = 56

-- Splits a UTF-8 string into a list of individual Unicode characters.
local function utf8chars(str)
  local t = {}
  for _, code in utf8.codes(str) do
    table.insert(t, utf8.char(code))
  end
  return t
end

-- Characters that need Shift (US keyboard layout)
local shiftMap = {
  ["~"] = "`", ["!"] = "1", ["@"] = "2", ["#"] = "3", ["$"] = "4",
  ["%"] = "5", ["^"] = "6", ["&"] = "7", ["*"] = "8", ["("] = "9",
  [")"] = "0", ["_"] = "-", ["+"] = "=", ["{"] = "[", ["}"] = "]",
  ["|"] = "\\", [":"] = ";", ['"'] = "'", ["<"] = ",", [">"] = ".",
  ["?"] = "/",
}

-- Press a key without modifiers using explicit keyDown/keyUp events.
local function pressKey(key)
  hs.eventtap.event.newKeyEvent(key, true):post()
  hs.eventtap.event.newKeyEvent(key, false):post()
end

-- Press a key WITH Shift, sending explicit flagsChanged events for the
-- Shift modifier.  Browser-based VNC consoles (e.g. Hetzner Cloud Console)
-- track modifier state through separate flagsChanged events – they ignore
-- the modifier flags embedded in regular key events.
local function pressWithShift(key)
  -- 1. Shift DOWN (flagsChanged)
  hs.eventtap.event.newKeyEvent(SHIFT_KEY, true)
      :setType(hs.eventtap.event.types.flagsChanged)
      :setFlags({shift = true})
      :post()
  -- 2. Key DOWN with shift flag
  hs.eventtap.event.newKeyEvent(key, true)
      :setFlags({shift = true})
      :post()
  -- 3. Key UP with shift flag
  hs.eventtap.event.newKeyEvent(key, false)
      :setFlags({shift = true})
      :post()
  -- 4. Shift UP (flagsChanged)
  hs.eventtap.event.newKeyEvent(SHIFT_KEY, false)
      :setType(hs.eventtap.event.types.flagsChanged)
      :setFlags({})
      :post()
end

-- Type a single character using raw key events for VNC compatibility.
local function typeChar(char)
  -- Whitespace / control
  if char == "\n" or char == "\r" then
    pressKey("return")
  elseif char == "\t" then
    pressKey("tab")
  elseif char == " " then
    pressKey("space")

  -- Uppercase letter → Shift + lowercase
  elseif char:match("^%u$") then
    pressWithShift(char:lower())

  -- Lowercase letter or digit → press directly
  elseif char:match("^%l$") or char:match("^%d$") then
    pressKey(char)

  -- Shifted punctuation (e.g. @ # $ !)
  elseif shiftMap[char] then
    pressWithShift(shiftMap[char])

  -- Unshifted punctuation (e.g. - = [ ] ; ' , . / ` \)
  elseif char:match("^[%p]$") then
    pressKey(char)

  -- Non-ASCII (Persian, Arabic, emoji, etc.) → fall back to text input
  else
    hs.eventtap.keyStrokes(char)
  end
end

-- Stop the escape listener.
local function stopEscapeTap()
  if escapeTap then
    escapeTap:stop()
    escapeTap = nil
  end
end

-- Start listening for Escape so the user can abort.
local function startEscapeTap()
  stopEscapeTap()
  escapeTap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(e)
    local code = e:getKeyCode()
    if code == hs.keycodes.map["escape"] then
      cancelFlag = true
      stopEscapeTap()
      hs.alert.show("⛔  Typing cancelled", 1.5)
      return true  -- swallow the Escape key
    end
    return false
  end):start()
end

-- Types chars one at a time with a small delay; robust for remote/VM environments.
local function typeChars(chars, index, total)
  if cancelFlag then return end
  if index > total then
    stopEscapeTap()
    hs.alert.show("✅  Done (" .. total .. " chars)", 1.5)
    return
  end

  -- Show progress every N chars
  if (index - 1) % progressEvery == 0 and total > progressEvery then
    hs.alert.closeAll(0)
    hs.alert.show("⌨️  " .. (index - 1) .. " / " .. total, 0.9)
  end

  typeChar(chars[index])
  hs.timer.doAfter(charDelay, function()
    typeChars(chars, index + 1, total)
  end)
end

hs.hotkey.bind({"alt", "cmd"}, "V", function()
  local text = hs.pasteboard.getContents()

  if not text or text == "" then
    hs.alert.show("⚠️  Clipboard is empty", 1.5)
    return
  end

  hs.alert.show("🖱  Click where to paste…", alertTimeout)

  if clickTap then clickTap:stop(); clickTap = nil end

  clickTap = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown}, function()
    -- one-shot: tear down the listener immediately
    clickTap:stop()
    clickTap = nil

    -- Wait for focus to settle, then start typing
    hs.timer.doAfter(focusDelay, function()
      local chars = utf8chars(text)
      local total = #chars
      cancelFlag = false
      startEscapeTap()
      hs.alert.closeAll(0)
      if total <= progressEvery then
        hs.alert.show("⌨️  Typing…", charDelay * total + focusDelay)
      end
      typeChars(chars, 1, total)
    end)

    return false  -- pass the click through to the app
  end):start()
end)
