local default_component_configs = {
    container = {
        enable_character_fade = true,
    },
    indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        with_expanders = nil,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
    },
}

local icon = {
    folder_closed = "",
    folder_open = "",
    folder_empty = "󰜌",
    provider = function(icon, node, _)
        if node.type == "file" or node.type == "terminal" then
            local success, web_devicons = pcall(require, "nvim-web-devicons")
            local name = node.type == "terminal" and "terminal" or node.name
            if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
            end
        end
    end,
    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
    -- then these will never be used.
    default = "*",
    highlight = "NeoTreeFileIcon",
    use_filtered_colors = true, -- Whether to use a different highlight when the file is filtered (hidden, dotfile, etc.).
}

local git = {
    modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
    },
    name = {
        trailing_slash = false,
        use_filtered_colors = true, -- Whether to use a different highlight when the file is filtered (hidden, dotfile, etc.).
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
    },
    status = {
        symbols = {
            -- Change type
            added = "", -- or "✚"
            modified = "", -- or ""
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
        },
    },
    file_size = {
        enabled = true,
        width = 12,          -- width of the column
        required_width = 64, -- min width of window required to show this column
    },

    type = {
        enabled = true,
        width = 10,           -- width of the column
        required_width = 122, -- min width of window required to show this column
    },

    last_modified = {
        enabled = true,
        width = 20,          -- width of the column
        required_width = 88, -- min width of window required to show this column
    },

    created = {
        enabled = true,
        width = 20,           -- width of the column
        required_width = 110, -- min width of window required to show this column
    },

    symlink_target = {
        enabled = false,
    },

    window = {
        position = "center",
        mapping_options = {
            noremap = true,
            nowait = true,
        }
    },
}

local event_handlers = {
    preview_window_open = {
        event = 'after_render',
        handler = function()
            local state = require('neo-tree.sources.manager').get_state('filesystem')
            if not require('neo-tree.sources.common.preview').is_active() then
                state.config = { use_float = true } -- or whatever your config is
                state.commands.toggle_preview(state)
            end
        end
    },
    preview_window_close = {
        event = "before_close",
        handler = function()
            local state = require('neo-tree.sources.manager').get_state('filesystem')
            if not require('neo-tree.sources.common.preview').is_active() then
                state.config = { use_float = true } -- or whatever your config is
                state.commands.toggle_preview(state)
            end
        end
    },
}


return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            event_handlers = {
                event_handlers.preview_window_open,
                event_handlers.preview_window_close,
            },
            enable_git_status = true,
            enable_diagnostics = true,
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            open_files_using_relative_paths = false,
            sort_case_insensitive = false,
            sort_function = nil,
            default_component_configs = default_component_configs,
            icon = icon,
            modified = git.modified,
            name = git.name,
            git_status = git.status,
            file_size = git.file_size,
            type = git.type,
            last_modified = git.last_modified,
            created = git.created,
            symlink_target = git.symlink_target,
            window = git.window,
        },
    }
}
