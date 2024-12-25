return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  opts = function()
    -- Fonction pour obtenir une citation humoristique aléatoire
    local function get_random_quote()
      local quotes = {
        "No code, no bugs.",
        "It works on my machine.",
        "If debugging is the process of removing bugs, then programming must be the process of putting them in.",
        "There’s no place like 127.0.0.1.",
        "Real programmers count from 0.",
        "Programming is like writing a book… except if you miss a single comma, the whole thing makes no sense.",
        "I don’t always test my code, but when I do, I do it in production.",
        "Why do Java developers wear glasses? Because they don’t C#.",
        "To understand recursion, you must first understand recursion.",
        "99 little bugs in the code, 99 bugs in the code. Take one down, patch it around, 127 little bugs in the code.",
        "There are 10 types of people in the world: those who understand binary and those who don’t.",
        "I have a joke about UDP, but I’m not sure if you’ll get it.",
        "When I wrote this code, only God and I understood what it does. Now, only God knows.",
        "Comment your code as if the person maintaining it is a violent psychopath who knows where you live.",
      }
      return quotes[math.random(#quotes)]
    end

    -- Combiner logo et citation directement
    local logo = [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⡆⠀⠀ ⢸⣿⣿⠿⠿⢿⣿⣿⣿⣿⡿⠿⠿⣿⣿⡇⠀⠀⠀⣾⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀
  ⠀⠀⠀⠀⢿⣿⠿⠿⠿⠿⣿⣿⣿⡏⠀⠀⠀⢹⣿⡇⠀⠀⠀⢸⣿⢱⣶⣴⣶⢹⣿⣿⡏⣶⣦⣶⡎⣿⡇⠀⠀⠀⢿⣿⠁⠀⠀⠈⣿⣿⣿⡿⠟⣋⣽⣿⣿⠇⠀⠀⠀⠀
  ⠀⠀⠀⠀⠘⣿⣧⣄⣀⣴⣿⣿⣿⣷⣄⣀⣠⣾⣟⠀⠀⠀⠀⠈⣿⣦⣙⣛⣡⣾⡿⢿⣷⣌⣛⣋⣴⣿⠁⠀⠀⠀⠘⣿⣦⣄⣀⣴⣿⣿⣿⣿⣶⣶⣤⣿⡟⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣏⣼⣌⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣰⣆⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣏⣼⣌⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠉⠉⢿⣿⣿⣿⣿⣿⣿⡏⠉⠁⠀⠀⠀⠀⠀⠀⠀⠉⠉⢹⣿⣿⣿⣿⣿⣿⡏⠉⠉⠀⠀⠀⠀⠀⠀⠀⠉⠉⣿⣿⣿⣿⣿⣿⣿⡏⠉⠁⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠁⠁⠉⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠁⠉⠉⠈⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠁⠁⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]
    
    local full_header = string.rep("\n", 3) .. logo .. "\n" .. get_random_quote() .. string.rep("\n", 2)

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(full_header, "\n"),
        center = {
          { action = 'Telescope find_files', desc = " Find File", icon = " ", key = "f" },
          { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = 'Telescope oldfiles', desc = " Recent Files", icon = " ", key = "r" },
          { action = 'Telescope live_grep', desc = " Find Text", icon = " ", key = "g" },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = "Mason", desc = " Mason", icon = "💬", key = "m" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    return opts
  end,
}
