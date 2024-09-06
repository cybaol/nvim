-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'akinsho/bufferline.nvim', version = '*', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  { 'neoclide/coc.nvim', branch = 'release' },

  -- { 'Exafunction/codeium.vim', event = 'BufEnter' },

  { 'CRAG666/code_runner.nvim', config = true },

  { 'numToStr/Comment.nvim', lazy = false },

  { 'glepnir/dashboard-nvim', event = 'VimEnter', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  { 'luozhiya/fittencode.nvim' },

  { 'mhartington/formatter.nvim' },

  { 'junegunn/fzf' },

  { 'junegunn/fzf.vim' },

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
