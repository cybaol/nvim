local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
end

vim.cmd([[ packadd packer.nvim ]])

return require('packer').startup({
  function(use)
    use({ 'akinsho/bufferline.nvim', tag = '*', requires = { 'nvim-tree/nvim-web-devicons', opt = true } })

    use({ 'neoclide/coc.nvim', branch = 'release' })

    use({ 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' })

    use({ 'numToStr/Comment.nvim' })

    use({ 'glepnir/dashboard-nvim', requires = 'nvim-telescope/telescope.nvim' })

    use({ 'mhartington/formatter.nvim' })

    use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })

    use({ 'lukas-reineke/indent-blankline.nvim' })

    use({ 'ggandor/leap.nvim' })

    use({ 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } })

    use({ 'iamcco/markdown-preview.nvim', ft = 'markdown', run = 'cd app && yarn install' })

    use({ 'windwp/nvim-autopairs' })

    use({ 'norcalli/nvim-colorizer.lua' })

    use({ 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, tag = 'nightly' })

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    use({ 'p00f/nvim-ts-rainbow', requires = { 'nvim-treesitter/nvim-treesitter' } })

    use({ 'nvim-tree/nvim-web-devicons' })

    use({ 'navarasu/onedark.nvim' })

    use({ 'wbthomason/packer.nvim' })

    use({ 'nvim-lua/plenary.nvim' })

    use({ 'lambdalisue/suda.vim' })

    use({ 'ur4ltz/surround.nvim' })

    use({ 'godlygeek/tabular', cmd = 'Tabularize' })

    use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })

    use({ 'mbbill/undotree', cmd = 'UndotreeToggle' })

    use({ 'fatih/vim-go', ft = 'go', run = ':GoInstallBinaries' })

    use({ 'yuezk/vim-js' })

    use({ 'honza/vim-snippets' })

    use({ 'dhruvasagar/vim-table-mode', cmd = 'TableModeToggle' })

    use({ 'voldikss/vim-translator' })

    use({
      'puremourning/vimspector',
      ft = { 'c', 'cpp', 'go', 'python' },
      run = ':VimspectorUpdate vscode-cpptools delve debugpy',
    })

    use({ 'liuchengxu/vista.vim', cmd = 'Vista' })

    use({ 'gcmt/wildfire.vim' })

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})
