-- ⌥⌘V → click where to paste → types clipboard content character-by-character
-- Works in VMware / remote sessions; handles Persian, Arabic, emoji, and all Unicode.
-- Press Escape any time to cancel typing mid-way.

local focusDelay      = 0.15    -- seconds to wait after click before typing starts
local charDelay       = 0.008   -- seconds between each character (prevents VMware drops)
local alertTimeout    = 8       -- seconds the "click where…" prompt stays visible
local progressEvery   = 20      -- show progress every N characters

local clickTap   = nil
local cancelFlag = false
local escapeTap  = nil

-- Splits a UTF-8 string into a list of individual Unicode characters.
local function utf8chars(str)
  local t = {}
  for _, code in utf8.codes(str) do
    table.insert(t, utf8.char(code))
  end
  return t
end

-- Map of special characters that keyStrokes() cannot handle reliably.
local specialKeys = {
  ["\n"] = "return",
  ["\r"] = "return",
  ["\t"] = "tab",
  [" "]  = "space",
}

-- Type a single character safely: special chars use keyStroke, rest use keyStrokes.
local function typeChar(char)
  local keyName = specialKeys[char]
  if keyName then
    hs.eventtap.keyStroke({}, keyName, 0)
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
