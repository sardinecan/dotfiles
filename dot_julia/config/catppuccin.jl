using StyledStrings: Face, loadface!

const _JULIA_COLORSCHEMES = Dict(
  "Tokyonight" => Dict(
    :julia_symbol => "bb9af7",
    :julia_comment => "565f89",
    :julia_number => "ff9e64",
    :julia_string => "9ece6a",
    :julia_funcall => "7aa2f7",
    :julia_operator => "89ddff",
    :julia_keyword => "bb9af7",
    :julia_macro => "f7768e",
    :julia_funcdef => "7aa2f7",
    :julia_error => "f7768e",
    :julia_type => "e0af68",
  ),
  "CatppuccinLatte" => Dict(
    :julia_symbol => "8839ef",
    :julia_comment => "7c7f93",
    :julia_string => "40a02b",
    :julia_funcall => "1e66f5",
    :julia_operator => "04a5e5",
    :julia_keyword => "8839ef",
    :julia_macro => "d20f39",
    :julia_funcdef => "1e66f5",
    :julia_error => "d20f39",
    :julia_type => "df8e1d",
    :julia_number => "fe640b",
  ),
  "CatppuccinFrappe" => Dict(
    :julia_symbol => "ca9ee6",
    :julia_comment => "949cbb",
    :julia_string => "a6d189",
    :julia_funcall => "8caaee",
    :julia_operator => "99d1db",
    :julia_keyword => "ca9ee6",
    :julia_macro => "e78284",
    :julia_funcdef => "8caaee",
    :julia_error => "e78284",
    :julia_type => "e5c890",
    :julia_number => "ef9f76",
  ),
  "CatppuccinMacchiato" => Dict(
    :julia_symbol => "c6a0f6",
    :julia_comment => "939ab7",
    :julia_string => "a6da95",
    :julia_funcall => "8aadf4",
    :julia_operator => "91d7e3",
    :julia_keyword => "c6a0f6",
    :julia_macro => "ed8796",
    :julia_funcdef => "8aadf4",
    :julia_error => "ed8796",
    :julia_type => "eed49f",
    :julia_number => "f5a97f",
  ),
  "CatppuccinMocha" => Dict(
    :julia_symbol => "cba6f7",
    :julia_comment => "9399b2",
    :julia_string => "a6e3a1",
    :julia_funcall => "89b4fa",
    :julia_operator => "89dceb",
    :julia_keyword => "cba6f7",
    :julia_macro => "f38ba8",
    :julia_funcdef => "89b4fa",
    :julia_error => "f38ba8",
    :julia_type => "f9e2af",
    :julia_number => "fab387",
  )
)

function colorscheme!(name::String)
  scheme = get(_JULIA_COLORSCHEMES, name, nothing)
  isnothing(scheme) && throw(ArgumentError("Unknown color scheme: $name"))

  for (face, color) in scheme
    loadface!(face => Face(foreground=parse(UInt32, color; base=16)))
  end

  if name == "Tokyonight"
    loadface!(:julia_operator => Face(weight=:bold))
    loadface!(:julia_keyword => Face(weight=:bold))
    loadface!(:julia_funcdef => Face(slant=:italic))
  else
    loadface!(:julia_operator => Face(weight=:normal))
    loadface!(:julia_keyword => Face(weight=:normal))
    loadface!(:julia_funcdef => Face(slant=:normal))
  end

  return nothing
end
