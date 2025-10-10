return {
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

            vim.lsp.config("ruby_lsp", {
                formatter = "rubocop",
                linters = "rubocop --lsp",
            })

            vim.lsp.enable('ruby_lsp')
            vim.lsp.enable('lua-language-server')
        end,
    },
}
