return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            -- { 'vijaymarupudi/nvim-fzf' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            -- { 'vijaymarupudi/nvim-fzf-commands' },
            { 'nvim-lua/plenary.nvim' },
        },
        config = function()
            -- local telescope = require("telescope")
            -- local actions = require("telescope.actions")


            -- telescope.load_extension("fzf")

            -- local keymap = vim.keymap
            --
            -- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
            --     { desc = "Fuzz find files in cwd" })
            -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
            -- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
            -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",
            --     { desc = "Find string under cursor in cwd" })
        end,
        extensions_list = { "fzf", "terms", "themes" },
    }
}
