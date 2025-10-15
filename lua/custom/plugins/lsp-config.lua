return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "suketa/nvim-dap-ruby"
        },
        config = function()
            require("dap-ruby").setup()
            require("dapui").setup()
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.lsp.config("lua-language-server", {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' },
                root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        }
                    }
                }
            })

            -- vim.lsp.config("ruby_lsp", {
            --     formatter = "rubocop",
            --     linters = "rubocop --lsp",
            -- })

            vim.lsp.config("solargraph", {
                formatter = "rubocop",
                linters = "rubocop --lsp",
                cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
                diagnostics = true,
                completion = true,
                -- transport = "socket",
                autoformat = true,
                definitions = true,
                folding = true,
                formatting = true,
                hover = true,
                references = true,
                rename = true,
                symbols = true,
            })

            vim.lsp.enable('solargraph')
            -- vim.lsp.enable('ruby_lsp')
            vim.lsp.enable('lua-language-server')
        end,
    },
}
