println("Salutations !")

# ------------------------------
# Activating OhMyREPL
# ------------------------------
using OhMyREPL

include("catppuccin.jl")
colorscheme!("CatppuccinMacchiato")
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
