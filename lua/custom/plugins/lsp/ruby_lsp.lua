---@brief
---
--- https://shopify.github.io/ruby-lsp/
---
--- This gem is an implementation of the language server protocol specification for
--- Ruby, used to improve editor features.
---
--- Install the gem. There's no need to require it, since the server is used as a
--- standalone executable.
---
--- ```sh
--- gem install ruby-lsp
--- ```

---@type vim.lsp.Config
return {
    {
        'adam12/ruby-lsp.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
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
    }
}
