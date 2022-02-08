local vim = vim
local mappings = {}

function mappings.load_mappings()
  vim.g.mapleader = ' '

  -- terminal
  vim.g.neoterm_autoscroll = 1
  vim.api.nvim_set_keymap('', 'ss', ':set nosplitright<CR>:vsplit<CR>', {})
  vim.api.nvim_set_keymap('', 'st', ':vs term://$SHELL<CR>', {})
  vim.api.nvim_set_keymap('t', '<C-n>', '<C-\\><C-N>', { noremap = true })
  vim.api.nvim_set_keymap('t', '<C-o>', '<C-\\><C-N><C-O>', { noremap = true })

  -- quick cursor
  vim.api.nvim_set_keymap('', 'i', '<PageUp>', { noremap = true })
  vim.api.nvim_set_keymap('', 'k', '<PageDown>', { noremap = true })
  vim.api.nvim_set_keymap('', 'j', 'h', { noremap = true })

  -- shift buffers
  vim.api.nvim_set_keymap('n', 'bp', ':bp<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', 'bn', ':bn<CR>', { noremap = true })
  vim.api.nvim_set_keymap('', '<C-x>', ':bd!<CR>', { noremap = true })

  -- shift window
  vim.api.nvim_set_keymap('', 'H', '<C-w>h', { noremap = true })
  vim.api.nvim_set_keymap('', 'J', '<C-w>j', { noremap = true })
  vim.api.nvim_set_keymap('', 'K', '<C-w>k', { noremap = true })
  vim.api.nvim_set_keymap('', 'L', '<C-w>l', { noremap = true })

  -- global replace
  vim.api.nvim_set_keymap('n', '<leader>r', ':%s///g<left><left><left>', { noremap = true })

  -- copy to system clipboard
  vim.api.nvim_set_keymap('v', 'Y', '"+y', { noremap = true })

  -- close search highlights
  vim.api.nvim_set_keymap('n', '<leader><cr>', ':nohl<CR>', { noremap = true })

  -- update all plugins with packer.nvim
  vim.api.nvim_set_keymap('n', 'U', ':PackerSync<CR>', { noremap = true })
end

return mappings
