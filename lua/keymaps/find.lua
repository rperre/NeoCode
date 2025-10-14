require("which-key").add({
    {
        "<leader>f",
        desc = "Find",
    },
    {
        "<space>fe",
        "<cmd>Telescope<cr>",
        desc = "Telescope",
        mode = "n",
    },
    {
        "<space>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Files",
        mode = "n",
    },
    {
        "<space>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent",
        mode = "n",
    },
    {
        "<space>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent",
        mode = "n",
    },
    {
        "<space>fs",
        "<cmd>Telescope live_grep<cr>",
        desc = "Fuzzy Files",
        mode = "n",
    },
    {
        "<space>fc",
        "<cmd>Telescope grep_string<cr>",
        desc = "Fuzzy string under cursor",
        mode = "n",
    },
})
