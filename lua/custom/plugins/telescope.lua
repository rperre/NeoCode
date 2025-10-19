return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    { 'vijaymarupudi/nvim-fzf' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-lua/plenary.nvim' },
    { 'jonarrien/telescope-cmdline.nvim' },
  },
  config = function()
    local telescope = require("telescope")
    -- local actions = require("telescope.actions")

    telescope.setup({
      extentions = {
        cmdline = {
          -- Adjust telescope picker size and layout
          picker   = {
            layout_config = {
              width  = 120,
              height = 25,
            }
          },
          -- Adjust your mappings
          mappings = {
            complete      = '<Tab>',
            run_selection = '<C-CR>',
            run_input     = '<CR>',
          },
          -- Triggers any shell command using overseer.nvim (`:!`)
          overseer = {
            enabled = true,
          },
        },
      },

    })

    telescope.load_extension("fzf")
    telescope.load_extension("cmdline")

    -- local keymap = vim.keymap
    --
    -- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
    --     { desc = "Fuzz find files in cwd" })
    -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",
    --     { desc = "Find string under cursor in cwd" })
  end,

  extensions_list = { "cmdline", "fzf", "terms", "themes" },
}
