local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,

  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 132,
  initial_rows = 43,
  
  color_scheme = "OneDark (base16)",

  --[[font = wezterm.font_with_fallback{
   
    "JetBrains Mono",
  
  },]]--

  font = wezterm.font_with_fallback({
    {
      family = "MonoLisa",
      weight = "Medium",
      stretch = "Normal",
      style = "Normal",
    },
    {
      family = "BlexMono Nerd Font Mono",
      weight = "Regular",
      stretch = "Normal",
      style = "Normal",
    },
    -- default configuration
    -- <built-in>, BuiltIn
    "JetBrains Mono",
    -- <built-in>, BuiltIn
    -- Assumed to have Emoji Presentation
    "Noto Color Emoji",
    -- <built-in>, BuiltIn
    "Symbols Nerd Font Mono",
  }),

  font_size = 16
}

return config
