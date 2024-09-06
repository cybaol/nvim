local vim = vim

-- coc.nvim
vim.cmd('source ~/.config/nvim/modules/coc-configs.vim')

-- codeium.vim
-- vim.g.codeium_enabled = true
-- vim.g.codeium_disable_bindings = 1
-- vim.keymap.set('i', '<C-p>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
-- vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-l>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

-- code_runner.nvim
require('code_runner').setup({
  term = {
    position = 'belowright',
    size = 15,
  },
  filetype = {
    c = '~/.config/nvim/lua/modules/compile.lua',
    cpp = '~/.config/nvim/lua/modules/compile.lua',
    cuda = '~/.config/nvim/lua/modules/compile.lua',
    go = 'go run .',
    lua = 'lua $fileName',
    python = 'python3 $fileName',
  },
})
vim.api.nvim_set_keymap('n', '<leader>cr', ':RunFile<CR>', { noremap = true, silent = true })

-- Comment.nvim
require('Comment').setup()

-- dashboard.nvim
require('dashboard').setup({
  theme = 'doom',
  config = {
    header = {
      '                                                       ',
      '                                                       ',
      '                                                       ',
      ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      '                                                       ',
      '                                                       ',
    },
    center = {
      {
        icon = '  ',
        icon_hi = 'Title',
        desc = 'Find  File                           ',
        desc_hi = 'String',
        key = 'ff',
        keymap = 'SPC f f',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
      },
      {
        icon = '  ',
        icon_hi = 'Title',
        desc = 'Find  Word                           ',
        desc_hi = 'String',
        key = 'fw',
        keymap = 'SPC f w',
        aciton = 'Telescope live_grep',
      },
      {
        icon = '  ',
        icon_hi = 'Title',
        desc = 'Recently opened files                ',
        desc_hi = 'String',
        key = 'fh',
        keymap = 'SPC f h',
        action = 'Telescope oldfiles',
      },
    },
    footer = { "Kino's neovim yyds" },
  },
})
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  ":lua require('telescope.builtin').oldfiles()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  ":lua require('telescope.builtin').find_files()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fw',
  ":lua require('telescope.builtin').live_grep()<CR>",
  { noremap = true, silent = true }
)

-- fittencode.nvim
require('fittencode').setup({
  use_default_keymaps = false,
  keymaps = {
    inline = {
      ['<C-p>'] = 'accept_all_suggestions',
    },
  },
})

-- formatter.nvim
require('modules.format')
vim.api.nvim_set_keymap('n', 'fm', ':w<CR>:Format<CR>', { noremap = true })

-- gitsigns.nvim
require('gitsigns').setup()

-- fzf.vim
vim.g.fzf_vim = {}

-- indent-blankline.nvim
vim.opt.list = true
require('ibl').setup({
  exclude = { filetypes = { 'dashboard' } },
})

-- leap.nvim
require('leap').add_default_mappings()

-- lualine.nvim
require('lualine').setup({
  options = {
    theme = 'dracula',
  },
})

-- markdown-preview.nvim
vim.g.mkdp_auto_start = 1
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_open_ip = ''
vim.g.mkdp_port = 1459

-- nvim-autopairs
require('nvim-autopairs').setup({
  map_cr = false,
})

-- nvim-bufferline.lua
require('bufferline').setup({
  options = {
    close_icon = '',
    show_buffer_close_icons = false,
  },
})

-- nvim-colorizer.lua
require('colorizer').setup()

-- nvim-surround
require('nvim-surround').setup()

-- nvim-tree.lua
require('nvim-tree').setup()
vim.g.nvim_tree_indent_markers = 1
vim.api.nvim_set_keymap('n', '<leader><tab>', ':NvimTreeToggle<CR>', { noremap = true })

-- nvim-treesitter
require('nvim-treesitter.install').prefer_git = true
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'c', 'cpp', 'cuda', 'go', 'lua', 'python' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
})

-- onedark.nvim
require('onedark').load()
local highlight = function(group, fg, bg, attr, sp)
  fg = fg and 'guifg=' .. fg or 'guifg=NONE'
  bg = bg and 'guibg=' .. bg or 'guibg=NONE'
  attr = attr and 'gui=' .. attr or 'gui=NONE'
  sp = sp and 'guisp=' .. sp or ''
  vim.api.nvim_command('highlight ' .. group .. ' ' .. fg .. ' ' .. bg .. ' ' .. attr .. ' ' .. sp)
end
highlight('CocMenuSel', '#F19EE2', nil, 'none', nil)

-- rainbow-delimiters.nvim
local rainbow_delimiters = require('rainbow-delimiters')
vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    vim = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterGreen',
    'RainbowDelimiterCyan',
    'RainbowDelimiterBlue',
    'RainbowDelimiterViolet',
    'RainbowDelimiterOrange',
    'RainbowDelimiterYellow',
  },
}

-- tabular
vim.api.nvim_set_keymap('v', '<leader><tab>', ':Tabularize /', { noremap = true })

-- todo-comments.nvim
require('todo-comments').setup()

-- undotree
vim.cmd('silent !mkdir -p ~/.config/nvim/tmp/backup')
vim.cmd('silent !mkdir -p ~/.config/nvim/tmp/undo')
vim.cmd('set backupdir=~/.config/nvim/tmp/backup,.')
vim.cmd('set directory=~/.config/nvim/tmp/backup,.')
if vim.fn.has('persistent_undo') then
  vim.cmd('set undofile')
  vim.cmd('set undodir=~/.config/nvim/tmp/undo,.')
end
vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_WindowLayout = 2
vim.g.undotree_DiffpanelHeight = 8
vim.g.undotree_SplitWidth = 24
vim.api.nvim_set_keymap('n', 'ud', ':UndotreeToggle<CR>', { noremap = true })

-- vim-go
vim.g.go_echo_go_info = 0
vim.g.go_doc_popup_window = 1
vim.g.go_def_mapping_enabled = 0
vim.g.go_template_autocreate = 0
vim.g.go_textobj_enabled = 0
vim.g.go_auto_type_info = 1
vim.g.go_def_mapping_enabled = 0
vim.g.go_highlight_array_whitespace_error = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_chan_whitespace_error = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_format_strings = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_function_parameters = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_space_tab_error = 1
vim.g.go_highlight_string_spellcheck = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_trailing_whitespace_error = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_variable_assignments = 0
vim.g.go_highlight_variable_declarations = 0
vim.g.go_doc_keywordprg_enabled = 0

-- vim-table-mode
vim.api.nvim_set_keymap('', '<leader>tm', ':TableModeToggle<CR>', { noremap = true })

-- vim-translator
vim.api.nvim_set_keymap('n', 'ts', ':Translate --engines=haici<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', 'ts', ':Translate --engines=haici<CR>', { noremap = false, silent = true })

-- vimspector
vim.api.nvim_exec2(
  [[
  let g:vimspector_enable_mappings = 'HUMAN'
  function! s:read_template_into_buffer(template)
      execute '0r ~/.config/nvim/vimspector-json/'.a:template
  endfunction
  command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
      \   'source': 'ls -1 ~/.config/nvim/vimspector-json',
      \   'down': 10,
      \   'sink': function('<sid>read_template_into_buffer')
      \ })
  nnoremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
  nnoremap <F7> :call vimspector#Reset()<CR>
  nmap <Leader>di <Plug>VimspectorBalloonEval
  xmap <Leader>di <Plug>VimspectorBalloonEval
  ]],
  {}
)

-- vista
vim.g.vista_icon_indent = { '╰─▸ ', '├─▸ ' }
vim.g.vista_default_executive = 'ctags'
vim.g.vista_fzf_preview = { 'right:50%' }
vim.cmd('let g:vista#renderer#enable_icon = 1')
vim.api.nvim_set_keymap('n', '<leader>]', ':Vista<CR>', { noremap = true })
