return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            -- local _, bufferline = pcall(require, "bufferline")
            local bufferline = require("bufferline")
            vim.opt.termguicolors = true
            bufferline.setup {}
        end,
    }
}
