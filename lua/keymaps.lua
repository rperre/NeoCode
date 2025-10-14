local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", opts)

-----------------
-- Normal mode --
-----------------
-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", "<cmd>lua vim.notify('Use l to move left')<CR>", opts)
vim.keymap.set("n", "<right>", "<cmd>lua vim.notify('Use h to move right')<CR>", opts)
vim.keymap.set("n", "<up>", "<cmd>lua vim.notify('Use k to move up')<CR>", opts)
vim.keymap.set("n", "<down>", "<cmd>lua vim.notify('Use j to move down')<CR>", opts)

-- <C-{hjkl}> for changing window
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- <C-{arrows} for changing buffer
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- LSP keybinds
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

-----------------
-- Visual mode --
-----------------
-- Indentation on visual mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

local map_multistep = require("mini.keymap").map_multistep
local map_combo = require("mini.keymap").map_combo
local mode = { "i", "c", "x", "s" }

map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<S-Tab>", { "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })

map_combo(mode, "jk", "<BS><BS><Esc>")
map_combo(mode, "kj", "<BS><BS><Esc>")
map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
map_combo("t", "kj", "<BS><BS><C-\\><C-n>")

local notify_many_keys = function(key)
    local lhs = string.rep(key, 5)
    local action = function() vim.notify("Too many " .. key) end
    require("mini.keymap").map_combo({ "n", "x" }, lhs, action)
end

notify_many_keys("h")
notify_many_keys("j")
notify_many_keys("k")
notify_many_keys("l")

require("which-key").add({
    {
        "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc = "List available commands",
        mode = "n"
    },
    {
        "<c-w><space>",
        function()
            require("which-key").show({ keys = "<c-w>", loop = true })
        end,
        mode = "n",
    },
    {
        "<space>q",
        "<cmd>q<cr>",
        desc = "Quit",
        mode = "n",
    },
    {
        "<leader>e",
        "<cmd>lua MiniFiles.open()<CR>",
        desc = "File Explorer",
        mode = "n",
        noremap = true,
    },
    {
        mode = "n",
        { "<leader>n", "<cmd>noh<CR>", desc = "Clear search highlight" },
    },
})

require "keymaps.buffer"
require "keymaps.code"
require "keymaps.find"
