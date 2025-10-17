return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec")
      },
    })
    require("neotest-rspec")({
      -- Optionally your function can take a position_type which is one of:
      -- - "file"
      -- - "test"
      -- - "dir"
      rspec_cmd = function(position_type)
        if position_type == "test" then
          return vim.tbl_flatten({
            "bundle",
            "exec",
            "rspec",
            "--fail-fast"
          })
        else
          return vim.tbl_flatten({
            "bundle",
            "exec",
            "rspec",
          })
        end
      end
    })
  end,
}
