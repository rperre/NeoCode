vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-----------------
-- Normal mode --
-----------------
-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', "<cmd>lua vim.notify('Use l to move left')<CR>")
vim.keymap.set('n', '<right>', "<cmd>lua vim.notify('Use h to move right')<CR>")
vim.keymap.set('n', '<up>', "<cmd>lua vim.notify('Use k to move up')<CR>")
vim.keymap.set('n', '<down>', "<cmd>lua vim.notify('Use j to move down')<CR>")

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


-----------------
-- Visual mode --
-----------------
-- Indentation on visual mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

local buffer_keys = {
    {
        "<leader>b",
        desc = "Buffer",
        mode = "n",
        noremap = true
    },
    {
        "<leader>b",
        desc = "Buffer",
        mode = "n",
        noremap = true
    },
    {
        "<leader>bb",
        "<cmd>Telescope buffers<CR>",
        desc = "Buffer list",
        mode = "n",
        noremap = true,
    },
    {
        "<leader>bd",
        "<cmd>bd<CR>",
        desc = "Delete buffer",
        mode = "n",
        noremap = true,
    },
    {
        "<leader>bn",
        "<cmd>bn<CR>",
        desc = "Next buffer",
        mode = "n",
        noremap = true,
    },
    {
        "<leader>bp",
        "<cmd>bp<CR>",
        desc = "Previous buffer",
        mode = "n",
        noremap = true,
    },
}

local find_keys = {
    {
        "<leader>f",
        desc = "Find",
    },
    {
        "<space>fe",
        "<cmd>Telescope<cr>",
        desc = "Telescope",
        mode = "n",
    },
    {
        "<space>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Files",
        mode = "n",
    },
    {
        "<space>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent",
        mode = "n",
    },
    {
        "<space>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent",
        mode = "n",
    },
    {
        "<space>fs",
        "<cmd>Telescope live_grep<cr>",
        desc = "Fuzzy Files",
        mode = "n",
    },
    {
        "<space>fc",
        "<cmd>Telescope grep_string<cr>",
        desc = "Fuzzy string under cursor",
        mode = "n",
    },
}

local code_keys = {
    {
        "<leader>cd",
        function()
            vim.diagnostic.open_float()
        end,
        desc = "Line diagnostics",
        mode = "n",
        noremap = true,
    },
    {
        "<leader>cf",
        function()
            vim.lsp.buf.format()
        end,
        desc = "Format Buffer",
        mode = "n",
        noremap = true,
    },
}

local map_multistep = require('mini.keymap').map_multistep

map_multistep('i', '<Tab>', { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>', { 'minipairs_bs' })


local map_combo = require('mini.keymap').map_combo

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { 'i', 'c', 'x', 's' }
map_combo(mode, 'jk', '<BS><BS><Esc>')

-- To not have to worry about the order of keys, also map "kj"
map_combo(mode, 'kj', '<BS><BS><Esc>')

-- Escape into Normal mode from Terminal mode
map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')

local notify_many_keys = function(key)
    local lhs = string.rep(key, 5)
    local action = function() vim.notify('Too many ' .. key) end
    require('mini.keymap').map_combo({ 'n', 'x' }, lhs, action)
end

notify_many_keys('h')
notify_many_keys('j')
notify_many_keys('k')
notify_many_keys('l')

require("which-key").add({
    {
        "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
        mode = "n"
    },
    {
        "<c-w><space>",
        function()
            require("which-key").show({ keys = "<c-w>", loop = true })
        end,
        desc = "Wimndow Hydra Mode (which-key)",
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
        mode = { "n", "v" },
        { "<leader>c", group = "Code" },
    },
    code_keys,
    buffer_keys,
    find_keys,
})
