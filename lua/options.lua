-- Hide cmdline bar
vim.o.cmdheight = 0

-- Terminal interaction
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in nvim

-- [ UI config ]
-- Spacing
-- vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme "NeoCode"
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
        prefix = ' ',
        spacing = 10,
    },
    signs = false,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-- local function dashboard_if_only_empty_buffer()
-- end
--
-- mine | au! BufRead | augroup END

local function no_buffers_worth_saving()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(bufnr, 'buflisted') and not vim.api.nvim_buf_get_option(bufnr, 'readonly') then -- disregard unlisted buffers
            if vim.api.nvim_buf_get_name(bufnr) ~= '' then
                return false                                                                                           -- there is a buffer with a name
            end
            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
            if #lines > 1 or (#lines == 1 and #lines[1] > 0) then
                return false -- there is a buffer with content
            end
        end
    end
    return true -- there are no listed, writable, named, nonempty buffers
end

local function open_dashboard_on_empty()
    -- local Snacks = require("snacks")
    -- Snacks.dashboard.open()
    -- vim.notify("BUFF ENTER")
    -- print(vim.api.nvim_list_bufs())
    local buf_list = vim.api.nvim_list_bufs()
    local pr = ""
    if no_buffers_worth_saving() then
        vim.notify("Should open dashboard")
    end
end

vim.api.nvim_create_autocmd("BufDelete", {
    group = vim.api.nvim_create_augroup("buf", { clear = true }),
    -- buffer = args.buf,
    callback = open_dashboard_on_empty,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--     group = vim.api.nvim_create_augroup("buf", { clear = true }),
--     -- buffer = args.buf,
--     callback = open_dashboard_on_empty,
-- })
