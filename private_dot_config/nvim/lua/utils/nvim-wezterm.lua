-- utils/nvim-wezterm.lua

PANE_ID = nil -- to store wezterm pane id

function SetPaneID(id)
    PANE_ID = id
    print("Pane ID set to: " .. id)
end

-- this function send code to wezterm pane
function SendToWezTerm(code)
    if not PANE_ID then
        print("Error: Pane ID is not set. Use :SetPaneID <pane-id>.")
        return
    end

    local send_command = string.format("echo '%s' | wezterm cli send-text --pane-id %s", code, PANE_ID)
    os.execute(send_command)
end

-- this function sends unique line of code to wezterm pane
function SendLineToWezTerm()
    local line = vim.fn.getline(".")
    SendToWezTerm(line)
end

-- this function sends block of code to wezterm pane
function SendSelectionToWezTerm()
    local lines = vim.fn.getline(vim.fn.line("'<"), vim.fn.line("'>"))
    local code = table.concat(lines, "\n")
    SendToWezTerm(code)
end

-- Cmde
vim.api.nvim_create_user_command("SetPaneID", function(opts)
    SetPaneID(opts.args)
end, { nargs = 1 })
