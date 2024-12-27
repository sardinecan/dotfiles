return {
  "akinsho/bufferline.nvim",
  version = "*", -- Assurez-vous d'utiliser la version compatible
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Pour les icônes de fichiers
  opts = {
    options = {
      mode = "buffers", -- Utiliser les buffers comme source principale
      numbers = "none", -- Pas de numérotation des buffers
      close_command = "bdelete! %d", -- Commande pour fermer un buffer
      right_mouse_command = "bdelete! %d", -- Commande pour fermer avec clic droit
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
      separator_style = "slant", -- Style de séparateur (slant, thin, thick, etc.)
      diagnostics = "nvim_lsp", -- Afficher les diagnostics via LSP
      diagnostics_indicator = function(count, level)
        local icon = (level:match("error") and " ") or " "
        return icon .. count
      end,
      show_buffer_close_icons = true, -- Icône pour fermer un buffer
      show_close_icon = false, -- Masquer l'icône de fermeture globale
      show_tab_indicators = true, -- Indiquer les buffers actifs/inactifs
      persist_buffer_sort = true, -- Conserver l'ordre des buffers
      max_name_length = 18, -- Limite pour les noms de buffers
      max_prefix_length = 15, -- Limite pour les préfixes des noms de buffers
      truncate_names = true, -- Troncation des noms trop longs
    },
  },
}

