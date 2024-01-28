local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://hub.nuaa.cf/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'akinsho/bufferline.nvim', version = '*', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  { 'neoclide/coc.nvim', branch = 'release' },

  { 'CRAG666/code_runner.nvim', config = true },

  { 'numToStr/Comment.nvim', lazy = false },

  { 'github/copilot.vim' },

  { 'glepnir/dashboard-nvim', event = 'VimEnter', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  { 'mhartington/formatter.nvim' },

  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },

  { 'folke/lazy.nvim' },

  { 'ggandor/leap.nvim' },

  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true } },

  { 'iamcco/markdown-preview.nvim', ft = 'markdown', build = 'cd app && yarn install' },

  { 'windwp/nvim-autopairs', event = 'InsertEnter' },

  { 'norcalli/nvim-colorizer.lua' },

  { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy' },

  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true } },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  { 'navarasu/onedark.nvim', priority = 1000 },

  { 'hiphish/rainbow-delimiters.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  { 'lambdalisue/suda.vim' },

  { 'godlygeek/tabular', cmd = 'Tabularize' },

  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  { 'folke/todo-comments.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  { 'mbbill/undotree', cmd = 'UndotreeToggle' },

  { 'fatih/vim-go', ft = 'go', build = ':GoInstallBinaries' },

  { 'yuezk/vim-js', ft = 'javascript' },

  { 'honza/vim-snippets' },

  { 'dhruvasagar/vim-table-mode', cmd = 'TableModeToggle' },

  { 'voldikss/vim-translator', cmd = 'Translate' },

  {
    'puremourning/vimspector',
    ft = { 'c', 'cpp', 'go', 'python' },
    -- build = ':VimspectorUpdate vscode-cpptools delve debugpy',
  },

  { 'liuchengxu/vista.vim', cmd = 'Vista' },

  { 'gcmt/wildfire.vim' },
})
