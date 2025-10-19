println("Salutations !")

# ------------------------------
# Activating OhMyREPL
# ------------------------------
atreplinit() do repl
  try
    @eval using OhMyREPL
    #include("catppuccin.jl")
    #OhMyREPL.colorscheme!("CatppuccinMacchiato") # or 'CatppuccinFrappe', 'CatppuccinMacchiato', 'CatppuccinMocha'
  catch e
    @warn "error while importing OhMyREPL" e
  end
end
# ------------------------------
# Activating env automatically
# ------------------------------
using Pkg
if isfile("Project.toml") && isfile("Manifest.toml")
  Pkg.activate(".")
end

# ------------------------------
# utility fonctions
# ------------------------------
function up()
  println("Updating all packages")
  Pkg.update()
end

function add(pkgname::String)
  println("Adding package $pkgname")
  Pkg.add(pkgname)
end

function rm(pkgname::String)
  println("Removing package $pkgname")
  Pkg.rm(pkgname)
end
