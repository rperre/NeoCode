return {
    {
        'adam12/ruby-lsp.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        globals = {
            "vim"
        },
        config = function()
            -- Auto format when saving
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp", { clear = true }),
                callback = function(args)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format { async = false, id = args.data.client_id }
                        end,
                    })
                end
            })
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "suketa/nvim-dap-ruby"
        },
        config = function()
            require("dap-ruby").setup()
        end
    },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
}
