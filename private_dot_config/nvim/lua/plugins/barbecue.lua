return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic", -- Pour extraire les informations de breadcrumbs
  },
  opts = {
    theme = "auto", -- Utilise le thème par défaut de l'éditeur
    show_modified = true, -- Affiche un indicateur si le fichier est modifié
    attach_navic = true, -- Active l'intégration automatique avec nvim-navic
    show_dirname = true, -- Affiche le nom du dossier courant dans les breadcrumbs
    show_basename = true, -- Affiche le nom du fichier courant
    symbols = {
      modified = "●", -- Indicateur de fichier modifié
      separator = ">", -- Séparateur entre les niveaux de breadcrumbs
    },
    exclude_filetypes = { "netrw", "gitcommit", "terminal", "git", "markdown", "toggleterm" }, -- Désactiver pour certains types de fichiers
  },
}

