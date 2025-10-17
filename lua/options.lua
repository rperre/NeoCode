-- Hide cmdline bar
vim.o.cmdheight = 0

-- Terminal interaction
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in nvim

-- [ UI config ]
-- vim.cmd.colorscheme "tokyonight"
vim.cmd.colorscheme "NeoCode"
vim.opt.tabstop = 2      -- number of visual spaces per TAB
vim.opt.softtabstop = 2  -- number of spaces in tab when editing
vim.opt.shiftwidth = 2   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of Python

---- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

---- Visual elements
vim.opt.wrap = false
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
  update_in_insert = false,
  severity_sort = true,
})

local function no_buffers_worth_saving()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(bufnr, 'buflisted') and not vim.api.nvim_buf_get_option(bufnr, 'readonly') then -- disregard unlisted buffers
      if vim.api.nvim_buf_get_name(bufnr) ~= '' then
        return false                                                                                               -- there is a buffer with a name
      end
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      if #lines > 1 or (#lines == 1 and #lines[1] > 0) then
        return false -- there is a buffer with content
      end
    end
  end
  return true -- there are no listed, writable, named, nonempty buffers
end
local buffer_visible = function(bufnr)
  for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do
    for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabid)) do
      local winbufnr = vim.api.nvim_win_get_buf(winid)
      local winvalid = vim.api.nvim_win_is_valid(winid)

      if winvalid and winbufnr == bufnr then
        return true
      end
    end
  end

  return false
end

local function has_content(lines)
  if #lines > 1 or (#lines == 1 and #lines[1] > 0) then
    return true
  end
  return false
end

local function open_dashboard_on_empty()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(bufnr, 'buflisted') and not vim.api.nvim_buf_get_option(bufnr, 'readonly') then -- disregard unlisted buffers
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      if vim.api.nvim_buf_get_name(bufnr) ~= '' and not has_content(lines) then
        require("snacks").dashboard.open()
      end
    end
  end
end

vim.api.nvim_create_autocmd("BufDelete", {
  group = vim.api.nvim_create_augroup("buf", { clear = true }),
  callback = open_dashboard_on_empty,
})
