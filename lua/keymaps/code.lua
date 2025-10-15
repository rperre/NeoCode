require("which-key").add({
    {
        mode = { "n", "v" },
        { "<leader>c", group = "Code" },
    },
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
    {
        "<leader>cD",
        function()
            require("dapui").toggle()
        end,
        desc = "DAP Toggle",
        mode = "n",
        noremap = true,
    },
    {
        "<leader>cR",
        function()
            require('dap').continue()
        end,
        desc = "DAP Start/Continue",
        mode = "n",
        noremap = true,
    },
    {
        "<leader>ct",
        function()
            require("neotest").summary.open()
        end,
        desc = "Test TUI Open",
        mode = "n",
        noremap = true,
    },
    {
        "<leader>cT",
        function()
            require("neotest").summary.close()
        end,
        desc = "Test TUI Close",
        mode = "n",
        noremap = true,
    },
})
