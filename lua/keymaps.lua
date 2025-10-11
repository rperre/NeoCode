vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
vim.o.cmdheight = 0

local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-----------------
-- Normal mode --
-----------------
-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- <C-{hjkl}> for changing window
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- <C-{arrows} for changing buffer
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- LSP keybinds
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})

-- Telescope
local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
    { desc = "Fuzz find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",
    { desc = "Find string under cursor in cwd" })

-----------------
-- Visual mode --
-----------------
-- Indentation on visual mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- TODO: rewrite all keybinds inside which-key wrapper
require("which-key").add({
    -- Define leader key
    {
        "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
        mode = "n"
    },
    -- Window Mode
    {
        "<c-w><space>",
        function()
            require("which-key").show({ keys = "<c-w>", loop = true })
        end,
        desc = "Wimndow Hydra Mode (which-key)",
        mode = "n",
    },
    {
        "<leader>f",
        desc = "Find",
    },
    -- Format current buffer
    {
        "<space>fe",
        "<cmd>Telescope<cr>",
        desc = "Telescope",
        mode = "n",
    },
    {
        "<leader>cf",
        function()
            vim.lsp.buf.format()
        end,
        -- group = "Code",
        desc = "Format Buffer",
        mode = "n",
        noremap = true,
    },
    -- Open NeoTree
    {
        "<leader>e",
        "<cmd>lua MiniFiles.open()<CR>",
        desc = "File Explorer",
        mode = "n",
        noremap = true,
    },
    -- Diagnostic float
    {
        "<leader>cd",
        function()
            vim.diagnostic.open_float()
        end,
        mode = "n",
        noremap = true,
    },
})
