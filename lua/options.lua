vim.cmd.colorscheme "NeoCode"

-- Terminal interaction
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in nvim

-- [ UI config ]
-- Spacing
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


local group = vim.api.nvim_create_augroup('OoO', {})

local function au(typ, pattern, cmdOrFn)
    if type(cmdOrFn) == 'function' then
        vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
    else
        vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
    end
end

vim.diagnostic.open_float(nil, {
    scope = "line",  -- Show diagnostics for the current line
    border = "rounded", -- Add a rounded border to the floating window
})

au({ 'CursorHold', 'InsertLeave' }, nil, function()
    local opts = {
        focusable = false,
        scope = 'cursor',
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
    }
    vim.diagnostic.open_float(nil, opts)
end)

au('InsertEnter', nil, function()
    vim.diagnostic.enable(false)
end)

au('InsertLeave', nil, function()
    vim.diagnostic.enable(true)
end)

local on_attach = function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
end
vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })
