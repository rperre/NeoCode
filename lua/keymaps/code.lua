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
})
