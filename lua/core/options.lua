local vim = vim
local options = setmetatable({}, { __index = { global_local = {}, buffer_window_local = {} } })

function options:load_options()
  global_local = {
    mouse = '',
    termguicolors = true,
    encoding = 'utf-8',
    clipboard = 'unnamedplus',
    cmdheight = 2,
    laststatus = 2,
    scrolloff = 5,
    foldlevelstart = 99,
    updatetime = 100,
    backup = false,
    writebackup = false,
    undofile = false,
    swapfile = false,
    smarttab = true,
    smartindent = true,
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,
    autochdir = true,
    hidden = true,
    splitright = true,
    splitbelow = true,
    showcmd = true,
    showmode = false,
    timeout = false,
    inccommand = 'split',
    foldmethod = 'indent',
    backspace = 'eol,indent,start',
    viewoptions = 'cursor,folds,slash,unix',
    completeopt = 'longest,menuone,noinsert,noselect,preview',
  }

  buffer_window_local = {
    -- buffer_local
    autoindent = true,
    expandtab = true,
    shiftwidth = 2,
    softtabstop = -1,
    tabstop = 2,
    -- window_local
    cursorline = true,
    list = true,
    listchars = [[tab:\¦\ ,trail:▫]],
    number = true,
    relativenumber = true,
    signcolumn = 'yes',
    wrap = false,
  }

  for name, value in pairs(global_local) do
    vim.api.nvim_set_option(name, value)
  end

  for name, value in pairs(buffer_window_local) do
    if value == true then
      vim.cmd('set ' .. name)
    elseif value == false then
      vim.cmd('set no' .. name)
    else
      vim.cmd('set ' .. name .. '=' .. value)
    end
  end

  vim.api.nvim_command('filetype on')
  vim.api.nvim_command('filetype indent on')
  vim.api.nvim_command('filetype plugin on')
  vim.api.nvim_command('syntax on')

  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.python_host_prog = '/usr/bin/python2'
  vim.g.python3_host_prog = '/usr/bin/python3'

  vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
end

return options
