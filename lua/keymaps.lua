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
  map_combo({ "n", "x" }, lhs, action)
end

local notify_vim_motions = function()
  vim.notify("User vim motions, not arrows")
end

notify_many_keys("h")
notify_many_keys("j")
notify_many_keys("k")
notify_many_keys("l")

-- local keymap = vim.keymap
--
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
--     { desc = "Fuzz find files in cwd" })
-- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",
--     { desc = "Find string under cursor in cwd" })

require("which-key").add({
  {
    "<down>",
    notify_vim_motions,
    mode = "n"
  },
  {
    "<up>",
    notify_vim_motions,
    mode = "n"
  },
  {
    "<right>",
    notify_vim_motions,
    mode = "n"
  },
  {
    "<left>",
    notify_vim_motions,
    mode = "n"
  },
  {
    "<C-k>",
    "<C-w>k",
    desc = "Resize Up",
    mode = "n"
  },
  {
    "<C-j>",
    "<C-w>j",
    desc = "Resize Up",
    mode = "n"
  },
  {
    "<C-h>",
    "<C-w>h",
    desc = "Resize Left",
    mode = "n"
  },
  {
    "<C-l>",
    "<C-w>l",
    desc = "Resize Right",
    mode = "n"
  },
  {
    "<C-Up>",
    ":resize +2<CR>",
    desc = "Resize Up",
    mode = "n"
  },
  {
    "<C-Down>",
    ":resize -2<CR>",
    desc = "Resize Down",
    mode = "n"
  },
  {
    "<C-Left>",
    ":vertical resize +2<CR>",
    desc = "Resize Left",
    mode = "n"
  },
  {
    "<C-Right>",
    ":vertical resize -2<CR>",
    desc = "Resize Right",
    mode = "n"
  },
  {
    "gD",
    "<cmd>lua vim.lsp.buf.declaration()<CR>",
    desc = "LSP Declarations",
    mode = "n"
  },
  {
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    desc = "LSP Definitions",
    mode = "n"
  },
  {
    ">",
    ">gv",
    desc = "Indent right",
    mode = "v"
  },
  {
    "<",
    "<gv",
    desc = "Indent left",
    mode = "v"
  },
  {
    ":",
    "<cmd>Telescope cmdline<CR>",
    desc = "Command Line",
    mode = "n"
  },
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "List available commands",
    mode = "n"
  },
  {
    "<space>q",
    "<cmd>q<cr>",
    desc = "Quit",
    mode = "n",
  },
  {
    "<leader>e",
    "<cmd>lua Snacks.picker.explorer()<CR>",
    desc = "File Explorer",
    mode = "n",
    noremap = true,
  },
  {
    "<leader>p",
    "<cmd>lua MiniFiles.open()<CR>",
    desc = "File Picker",
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
require "keymaps.window"
