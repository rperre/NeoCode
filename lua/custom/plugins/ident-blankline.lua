return {
    "lukas-reineke/indent-blankline.nvim",
    -- main = "ibl",
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("ibl").setup()
        -- local blankline = require("ibl")
        -- local hooks = require("ibl.hooks")
        --
        -- vim.opt.list = true
        -- -- vim.opt.listchars:append("space:⋅")
        --
        -- local highlight = {
        --     "CursorColumn",
        --     "Whitespace",
        -- }
        --
        -- blankline.setup({
        --     -- scope = {
        --     --     enabled = false,
        --     --     char = "A",
        --     --     show_exact_scope = true,
        --     -- },
        --     indent = { highlight = highlight, char = " " },
        --     -- whitespace = {
        --     --     highlight = highlight,
        --     --     remove_blankline_trail = false,
        --     -- },
        -- })
    end,
}
