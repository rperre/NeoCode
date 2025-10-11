---@diagnostic disable: undefined-field
--- @type LazyPluginSpec
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "letieu/harpoon-lualine",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leaderha", function()
            harpoon:list():append()
        end, { silent = true, desc = "Append current file to harpoon" })
        vim.keymap.set("n", "<leaderhh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { silent = true, desc = "Toggle harpoon quick menu" })

        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end, { silent = true, desc = "Jumps to item 1 in the list" })
        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end, { silent = true, desc = "Jumps to item 2 in the list" })
        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end, { silent = true, desc = "Jumps to item 3 in the list" })
        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end, { silent = true, desc = "Jumps to item 4 in the list" })
    end,
}
