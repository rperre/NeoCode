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
            -- require('mini.visits').setup()
            --
        end,
    },
}
