-- Setup NeoTree
require("neo-tree").setup {
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    open_files_using_relative_paths = false,
    sort_case_insensitive = false,
    sort_function = nil,
    default_component_configs = {
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
    },
    icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
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
    },
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
    git_status = {
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
    -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
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
        },
    },
    -- mappings = {
    -- 	["<cr>"] = "open",
    -- 	["<esc>"] = "cancel",
    -- 	["P"] = {
    -- 		"toggle_preview",
    -- 		config = {
    -- 			use_float = true,
    -- 			use_snacks_image = true,
    -- 			use_image_nvim = true,
    -- 		},
    -- 	},
    -- 	["l"] = "focus_preview",
    -- 	["S"] = "open_split",
    -- 	["s"] = "open_vsplit",
    -- 	["t"] = "open_tabnew",
    -- 	["w"] = "open_with_window_picker",
    -- 	["C"] = "close_node",
    -- 	["z"] = "close_all_nodes",
    -- 	["Z"] = "expand_all_subnodes",
    -- 	["a"] = {
    -- 		"add",
    -- 		config = {
    -- 			show_path = "none", -- "none", "relative", "absolute"
    -- 		},
    -- 	},
    -- 	["A"] = "add_directory",
    -- 	["d"] = "delete",
    -- 	["r"] = "rename",
    -- 	["b"] = "rename_basename",
    -- 	["y"] = "copy_to_clipboard",
    -- 	["x"] = "cut_to_clipboard",
    -- 	["p"] = "paste_from_clipboard",
    -- 	["c"] = "copy",
    -- 	["m"] = "move",
    -- 	["q"] = "close_window",
    -- 	["R"] = "refresh",
    -- 	["?"] = "show_help",
    -- 	["<"] = "prev_source",
    -- 	[">"] = "next_source",
    -- 	["i"] = "show_file_details",
    -- },
    event_handlers = {
        {
            event = 'after_render',
            handler = function()
                local state = require('neo-tree.sources.manager').get_state('filesystem')
                if not require('neo-tree.sources.common.preview').is_active() then
                    state.config = { use_float = true } -- or whatever your config is
                    state.commands.toggle_preview(state)
                end
            end
        },
        {
            event = "before_close",
            handler = function()
                local state = require('neo-tree.sources.manager').get_state('filesystem')
                if not require('neo-tree.sources.common.preview').is_active() then
                    state.config = { use_float = true } -- or whatever your config is
                    state.commands.toggle_preview(state)
                end
            end
        }
    },
}

-- Setup Telescope
require('telescope').load_extension('fzf')
--
local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
    { desc = "Fuzz find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",
    { desc = "Find string under cursor in cwd" })

-- Setup Bufferline
require("bufferline").setup {}

-- Setup fzf commands
require("fzf-commands")


-- Setup CMP

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

            -- For `mini.snippets` users:
            -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
            -- insert({ body = args.body }) -- Insert at cursor
            -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
            -- require("cmp.config").set_onetime({ sources = {} })
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]] --

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')
-- vim.lsp.config['ruby_lsp'] = {
-- 	capabilities = capabilities
-- }

-- Setup Lua LSP
vim.lsp.config['lua-language-server'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    }
}
vim.lsp.enable('lua-language-server')

---- Setup Ruby LSP
vim.lsp.config("ruby_lsp", {
    formatter = "rubocop",
    linters = "rubocop --lsp",
})
vim.lsp.enable('ruby_lsp')



-- Setup Lint
-- require('lint').linters_by_ft = {
--     ruby = { 'rubocop' },
-- }
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     callback = function()
--         -- try_lint without arguments runs the linters defined in `linters_by_ft`
--         -- for the current filetype
--         require("lint").try_lint()
--
--         -- You can call `try_lint` with a linter name or a list of names to always
--         -- run specific linters, independent of the `linters_by_ft` configuration
--         require("lint").try_lint("cspell")
--     end,
-- })


-- require('lint').linters.rubocop = {
--     cmd = 'rubocop --lsp',
--     stdin = true,            -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
--     append_fname = true,     -- Automatically append the file name to `args` if `stdin = false` (default: true)
--     args = {},               -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
--     stream = nil,            -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
--     ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
--     env = nil,               -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
--     parser = your_parse_function
-- }



-- Setup TreeSitter
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "ruby", "javascript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    -- ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
