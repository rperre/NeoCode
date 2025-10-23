return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    -- require('mini.notify').setup()
    require('mini.sessions').setup(
      {
        -- Whether to read default session if Neovim opened without file arguments
        autoread = true,

        -- Whether to write currently read session before leaving it
        autowrite = true,

        -- Directory where global sessions are stored (use `''` to disable)
        directory = "", --<"session" subdir of user data directory from |stdpath()|>,

        -- File for local session (use `''` to disable)
        file = 'session.neo',

        -- Whether to force possibly harmful actions (meaning depends on function)
        force = { read = false, write = true, delete = false },

        -- Hook functions for actions. Default `nil` means 'do nothing'.
        hooks = {
          -- Before successful action
          pre = { read = nil, write = nil, delete = nil },
          -- After successful action
          post = { read = nil, write = nil, delete = nil },
        },

        -- Whether to print session path after action
        verbose = { read = false, write = true, delete = true },
      })
    require('mini.icons').setup()
    require('mini.snippets').setup()
    require('mini.completion').setup()
    require('mini.bufremove').setup()
    require('mini.extra').setup()
    require('mini.files').setup()
    require('mini.indentscope').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('mini.tabline').setup()
    require('mini.comment').setup()
    require('mini.keymap').setup()
    require('mini.move').setup()
    require('mini.pick').setup()
    require('mini.ai').setup()
    require('mini.statusline').setup()
    -- require('mini.hues').setup({ background = '#000000', foreground = '#cdc4c6' })
    -- require('mini.colors').get_colorscheme():add_transparency():write({ name = 'NeoCode' })
  end,
}
