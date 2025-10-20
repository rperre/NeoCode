return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    -- require('mini.notify').setup()
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
