local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- BiDi
config.bidi_enabled = true
config.bidi_direction = "AutoLeftToRight"

-- Rendering
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.font_shaper = "Harfbuzz"
config.harfbuzz_features = { "calt", "liga", "clig" }

-- UI: Ghostty-like integrated top area
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBar"

-- Make the integrated top bar blend better
config.window_frame = {
  active_titlebar_bg = "#1e222a",
  inactive_titlebar_bg = "#1e222a",
  button_fg = "#dcdfe4",
  button_bg = "#1e222a",
  button_hover_fg = "#ffffff",
  button_hover_bg = "#2a2f3a",
}

-- Layout
config.window_padding = {
  left = 15,
  right = 15,
  top = 10,
  bottom = 12,
}

config.scrollback_lines = 20000
config.scroll_to_bottom_on_input = true

-- Glass / Blur
config.window_background_opacity = 0.78
config.macos_window_background_blur = 30
config.text_background_opacity = 0.92

-- Fonts
config.font = wezterm.font_with_fallback({
  { family = "JetBrains Mono", weight = "Medium" },
  { family = "Vazirmatn", weight = "Regular" },
  { family = "Noto Naskh Arabic" },
})

config.font_size = 14.0
config.line_height = 1.15
config.warn_about_missing_glyphs = false

-- Colors
config.color_schemes = {
  ["Ghostty-OneDark-ish"] = {
    foreground = "#dcdfe4",
    background = "#1e222a",

    cursor_bg = "#e5c07b",
    cursor_fg = "#1e222a",
    cursor_border = "#e5c07b",

    selection_bg = "#405060",
    selection_fg = "#dcdfe4",

    ansi = {
      "#1e222a",
      "#e06c75",
      "#98c379",
      "#e5c07b",
      "#61afef",
      "#c678dd",
      "#56b6c2",
      "#dcdfe4",
    },

    brights = {
      "#545862",
      "#e06c75",
      "#98c379",
      "#e5c07b",
      "#61afef",
      "#e5c07b",
      "#56b6c2",
      "#ffffff",
    },
  },
}

config.color_scheme = "Ghostty-OneDark-ish"

return config