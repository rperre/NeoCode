return {
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          require("hover.providers.lsp")
          require('hover.providers.dap')
          require('hover.providers.diagnostic')
        end,
        preview_opts = {
          border = 'single'
        },
        preview_window = true,
        title = true,
        mouse_providers = {
          'LSP',
          'DAP'
        },
        mouse_delay = 10000
      }

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })

      -- Mouse support
      vim.o.mousemoveevent = true
      vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
    end
  }
}
