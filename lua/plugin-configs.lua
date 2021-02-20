-- formatter.nvim
require'format'

-- galaxyline.nvim
require'eviline'

-- indent-guides.nvim
require'indent_guides'.setup {}

-- nvim-bufferline.lua
require'bufferline'.setup {
  options = {
    close_icon = '',
    show_buffer_close_icons = false
  }
}

-- nvim-colorizer.lua
require'colorizer'.setup {}

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "toml", "typescript" },
  highlight = {
    enable = true
  },
  indent = {
    enable = false
  }
}
