-- Terminal interaction
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in nvim

-- [ UI config ]
-- Spacing
vim.cmd.colorscheme "NeoCode2"
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spaces in tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of Python

---- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

---- Visual elements
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right
vim.opt.termguicolors = true  -- enable 24-bit RGB color in the TUI
vim.opt.showmode = true       -- we are experienced, wo don't need the "-- INSERT --" mode hint

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Customize prefix symbol
        spacing = 2, -- Adjust spacing between text and diagnostic
    },
    signs = false, -- Show signs in the gutter
    underline = true, -- Underline the error text
    update_in_insert = false, -- Update diagnostics only on leaving insert mode
    severity_sort = true, -- Sort adiagnostics by severity
})
