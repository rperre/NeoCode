return {
    {
        'nvim-mini/mini.nvim',
        version = '*',
        config = function()
            require('mini.notify').setup()
            require('mini.icons').setup()
            require('mini.snippets').setup()
            require('mini.completion').setup()
            require('mini.bufremove').setup()
            require('mini.extra').setup()
            require('mini.files').setup()
            require('mini.indentscope').setup()
            require('mini.git').setup()
            require('mini.diff').setup()
            require('mini.statusline').setup()
            require('mini.tabline').setup()
            require('mini.comment').setup()
            require('mini.keymap').setup()
            require('mini.move').setup()
            require('mini.pick').setup()
            require('mini.ai').setup()

            require('mini.hues').setup({ background = '#000000', foreground = '#cdc4c6' })
            -- require('mini.colors').get_colorscheme():add_transparency():write({ name = 'NeoCode' })



            local map_multistep = require('mini.keymap').map_multistep

            map_multistep('i', '<Tab>', { 'pmenu_next' })
            map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
            map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
            map_multistep('i', '<BS>', { 'minipairs_bs' })


            local map_combo = require('mini.keymap').map_combo

            -- Support most common modes. This can also contain 't', but would
            -- only mean to press `<Esc>` inside terminal.
            local mode = { 'i', 'c', 'x', 's' }
            map_combo(mode, 'jk', '<BS><BS><Esc>')

            -- To not have to worry about the order of keys, also map "kj"
            map_combo(mode, 'kj', '<BS><BS><Esc>')

            -- Escape into Normal mode from Terminal mode
            map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
            map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')

            local notify_many_keys = function(key)
                local lhs = string.rep(key, 5)
                local action = function() vim.notify('Too many ' .. key) end
                require('mini.keymap').map_combo({ 'n', 'x' }, lhs, action)
            end
            notify_many_keys('h')
            notify_many_keys('j')
            notify_many_keys('k')
            notify_many_keys('l')
        end,
    },
}
