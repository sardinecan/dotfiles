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

  font_size = 16,

  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 },
  keys = {
    {
      key = '|',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      mods = "LEADER",
      key = "w",
      action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
      mods = "LEADER",
      key = "b",
      action = wezterm.action.ActivateTabRelative(-1)
    },
    {
      mods = "LEADER",
      key = "n",
      action = wezterm.action.ActivateTabRelative(1)
    },
    {
      mods = "LEADER",
      key = "|",
      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
      mods = "LEADER",
      key = "-",
      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
      mods = "LEADER",
      key = "h",
      action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
      mods = "LEADER",
      key = "j",
      action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
      mods = "LEADER",
      key = "k",
      action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
      mods = "LEADER",
      key = "l",
      action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
      mods = "LEADER",
      key = "LeftArrow",
      action = wezterm.action.AdjustPaneSize { "Left", 5 }
    },
    {
      mods = "LEADER",
      key = "RightArrow",
      action = wezterm.action.AdjustPaneSize { "Right", 5 }
    },
    {
      mods = "LEADER",
      key = "DownArrow",
      action = wezterm.action.AdjustPaneSize { "Down", 5 }
    },
    {
      mods = "LEADER",
      key = "UpArrow",
      action = wezterm.action.AdjustPaneSize { "Up", 5 }
    },
  }
}

return config
