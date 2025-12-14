using Crayons
import OhMyREPL: Passes.SyntaxHighlighter

function _create_tokyonight_colorscheme()
  scheme = SyntaxHighlighter.ColorScheme()
  SyntaxHighlighter.symbol!(scheme, crayon"bb9af7")  # Purple
  SyntaxHighlighter.comment!(scheme, crayon"565f89")  # Comment
  SyntaxHighlighter.number!(scheme, crayon"ff9e64")  # Orange
  SyntaxHighlighter.string!(scheme, crayon"9ece6a")  # Green
  SyntaxHighlighter.call!(scheme, crayon"7aa2f7")  # Blue
  SyntaxHighlighter.op!(scheme, crayon"bold 89ddff")  # Cyan
  SyntaxHighlighter.keyword!(scheme, crayon"bold bb9af7")  # Purple
  SyntaxHighlighter.macro!(scheme, crayon"f7768e")  # Red
  SyntaxHighlighter.function_def!(scheme, crayon"italics 7aa2f7")  # Blue
  SyntaxHighlighter.text!(scheme, crayon"c0caf5")  # Foreground
  SyntaxHighlighter.error!(scheme, crayon"f7768e")  # Red
  SyntaxHighlighter.argdef!(scheme, crayon"e0af68")  # Yellow
  scheme
end

SyntaxHighlighter.add!("Tokyonight", _create_tokyonight_colorscheme())

function _create_catppuccin_latte_colorscheme()
  scheme = SyntaxHighlighter.ColorScheme()
  SyntaxHighlighter.symbol!(scheme, crayon"8839ef")  # Mauve
  SyntaxHighlighter.comment!(scheme, crayon"7c7f93")  # Overlay1
  SyntaxHighlighter.string!(scheme, crayon"40a02b")  # Green
  SyntaxHighlighter.call!(scheme, crayon"1e66f5")  # Blue
  SyntaxHighlighter.op!(scheme, crayon"04a5e5")  # Sky
  SyntaxHighlighter.keyword!(scheme, crayon"8839ef")  # Mauve
  SyntaxHighlighter.macro!(scheme, crayon"d20f39")  # Red
  SyntaxHighlighter.function_def!(scheme, crayon"1e66f5")  # Blue
  SyntaxHighlighter.text!(scheme, crayon"4c4f69")  # Text
  SyntaxHighlighter.error!(scheme, crayon"d20f39")  # Red
  SyntaxHighlighter.argdef!(scheme, crayon"df8e1d")  # Yellow
  SyntaxHighlighter.number!(scheme, crayon"fe640b")  # Peach
  scheme
end

SyntaxHighlighter.add!("CatppuccinLatte", _create_catppuccin_latte_colorscheme())

function _create_catppuccin_frappe_colorscheme()
  scheme = SyntaxHighlighter.ColorScheme()
  SyntaxHighlighter.symbol!(scheme, crayon"ca9ee6")  # Mauve
  SyntaxHighlighter.comment!(scheme, crayon"949cbb")  # Overlay1
  SyntaxHighlighter.string!(scheme, crayon"a6d189")  # Green
  SyntaxHighlighter.call!(scheme, crayon"8caaee")  # Blue
  SyntaxHighlighter.op!(scheme, crayon"99d1db")  # Sky
  SyntaxHighlighter.keyword!(scheme, crayon"ca9ee6")  # Mauve
  SyntaxHighlighter.macro!(scheme, crayon"e78284")  # Red
  SyntaxHighlighter.function_def!(scheme, crayon"8caaee")  # Blue
  SyntaxHighlighter.text!(scheme, crayon"c6d0f5")  # Text
  SyntaxHighlighter.error!(scheme, crayon"e78284")  # Red
  SyntaxHighlighter.argdef!(scheme, crayon"e5c890")  # Yellow
  SyntaxHighlighter.number!(scheme, crayon"ef9f76")  # Peach
  scheme
end

SyntaxHighlighter.add!("CatppuccinFrappe", _create_catppuccin_frappe_colorscheme())

function _create_catppuccin_macchiato_colorscheme()
  scheme = SyntaxHighlighter.ColorScheme()
  SyntaxHighlighter.symbol!(scheme, crayon"c6a0f6")  # Mauve
  SyntaxHighlighter.comment!(scheme, crayon"939ab7")  # Overlay1
  SyntaxHighlighter.string!(scheme, crayon"a6da95")  # Green
  SyntaxHighlighter.call!(scheme, crayon"8aadf4")  # Blue
  SyntaxHighlighter.op!(scheme, crayon"91d7e3")  # Sky
  SyntaxHighlighter.keyword!(scheme, crayon"c6a0f6")  # Mauve
  SyntaxHighlighter.macro!(scheme, crayon"ed8796")  # Red
  SyntaxHighlighter.function_def!(scheme, crayon"8aadf4")  # Blue
  SyntaxHighlighter.text!(scheme, crayon"cad3f5")  # Text
  SyntaxHighlighter.error!(scheme, crayon"ed8796")  # Red
  SyntaxHighlighter.argdef!(scheme, crayon"eed49f")  # Yellow
  SyntaxHighlighter.number!(scheme, crayon"f5a97f")  # Peach
  scheme
end

SyntaxHighlighter.add!("CatppuccinMacchiato", _create_catppuccin_macchiato_colorscheme())

function _create_catppuccin_mocha_colorscheme()
  scheme = SyntaxHighlighter.ColorScheme()
  SyntaxHighlighter.symbol!(scheme, crayon"cba6f7")  # Mauve
  SyntaxHighlighter.comment!(scheme, crayon"9399b2")  # Overlay1
  SyntaxHighlighter.string!(scheme, crayon"a6e3a1")  # Green
  SyntaxHighlighter.call!(scheme, crayon"89b4fa")  # Blue
  SyntaxHighlighter.op!(scheme, crayon"89dceb")  # Sky
  SyntaxHighlighter.keyword!(scheme, crayon"cba6f7")  # Mauve
  SyntaxHighlighter.macro!(scheme, crayon"f38ba8")  # Red
  SyntaxHighlighter.function_def!(scheme, crayon"89b4fa")  # Blue
  SyntaxHighlighter.text!(scheme, crayon"cdd6f4")  # Text
  SyntaxHighlighter.error!(scheme, crayon"f38ba8")  # Red
  SyntaxHighlighter.argdef!(scheme, crayon"f9e2af")  # Yellow
  SyntaxHighlighter.number!(scheme, crayon"fab387")  # Peach
  scheme
end

SyntaxHighlighter.add!("CatppuccinMocha", _create_catppuccin_mocha_colorscheme())
