-- Variable globale pour stocker le pane ID de WezTerm
PANE_ID = nil

-- Fonction pour définir l'ID du pane
function SetPaneID(id)
    PANE_ID = id
    print("Pane ID set to: " .. id)
end

-- Fonction pour envoyer du code au panneau WezTerm et exécuter le code
function SendToWezTerm(code)
    if not PANE_ID then
        print("Error: Pane ID is not set. Use :SetPaneID <pane-id>.")
        return
    end
    -- Envoi du code au panneau sans échappement
    local send_command = string.format("echo '%s' | wezterm cli send-text --pane-id %s", code, PANE_ID)
    os.execute(send_command)
end

-- Fonction pour envoyer une ligne unique de code
function SendLineToWezTerm()
    local line = vim.fn.getline(".")
    SendToWezTerm(line)
end

-- Fonction pour envoyer une sélection de code
function SendSelectionToWezTerm()
    local lines = vim.fn.getline(vim.fn.line("'<"), vim.fn.line("'>"))
    local code = table.concat(lines, "\n")
    SendToWezTerm(code)
end

-- Commandes et raccourcis pour envoyer du code
vim.api.nvim_create_user_command("SetPaneID", function(opts)
    SetPaneID(opts.args)
end, { nargs = 1 })

vim.api.nvim_set_keymap("n", "<leader>r", ":lua SendLineToWezTerm()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>r", ":lua SendSelectionToWezTerm()<CR>", { noremap = true, silent = true })

