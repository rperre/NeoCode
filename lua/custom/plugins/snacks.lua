return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                formats = {
                    key = function(item)
                        return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
                    end,
                },
                sections = {
                    { section = "terminal",     cmd = "fortune | cowsay",        hl = "header", padding = 1, indent = 8 },
                    { title = "Recent",         padding = 1 },
                    { section = "recent_files", limit = 8,                            padding = 1 },
                    { title = "Recent from ",   file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
                    { section = "recent_files", cwd = true,                           limit = 8,     padding = 1 },
                    { title = "Sessions",       padding = 1 },
                    { section = "projects",     padding = 1 },
                    { title = "Bookmarks",      padding = 1 },
                    { section = "keys" },
                },
            },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    }
}
