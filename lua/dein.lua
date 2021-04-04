local vim = vim
local dein = {}

function is_dir(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat and stat.type == 'directory'
end

function dein.load_repos()
  local dein_path = os.getenv('HOME') .. '/.cache/dein/'
  local dein_dir  = dein_path .. 'repos/github.com/Shougo/dein.vim'
  local dein_cmd  = 'git clone https://github.com/Shougo/dein.vim ' .. dein_dir

  if vim.fn.has('vim_starting') then
    vim.api.nvim_set_var('dein#auto_recache', 1)
    vim.api.nvim_set_var('dein#install_max_processes', 16)

    if not vim.o.runtimepath:match('/dein.vim') then
      if not is_dir(dein_dir) then
        os.execute(dein_cmd)
      end
      vim.o.runtimepath = vim.o.runtimepath .. ',' .. dein_dir
    end
  end

  if vim.fn['dein#load_state'](dein_path) == 1 then

    vim.fn['dein#begin'](dein_path)

    vim.fn['dein#load_toml']('~/.config/nvim/dein/dein.toml')

    vim.fn['dein#end']()
    vim.fn['dein#save_state']()

  end

  vim.api.nvim_command('filetype plugin indent on')

  if vim.fn.has('vim_starting') == 1 then
    vim.api.nvim_command('syntax enable')
  end

  if vim.fn['dein#check_install']() == 1 then
    vim.fn['dein#install']()
  end
end

return dein
