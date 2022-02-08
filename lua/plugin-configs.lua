local vim = vim

-- coc.nvim
vim.api.nvim_exec('source ~/.config/nvim/modules/coc-configs.vim', false)

-- code_runner.nvim
require('code_runner').setup({
  term = {
    position = 'belowright',
    size = 15,
  },
  filetype = {
    c = 'lua ~/.config/nvim/lua/compile.lua',
    cpp = 'lua ~/.config/nvim/lua/compile.lua',
    cuda = 'lua ~/.config/nvim/lua/compile.lua',
    go = 'go run .',
    lua = 'lua $fileName',
    python = 'python3 $fileName',
  },
})
vim.api.nvim_set_keymap('n', '<leader>cr', ':RunCode<CR>', { noremap = true, silent = true })

-- Comment.nvim
require('Comment').setup()

-- dashboard.nvim
vim.g.dashboard_default_executive = 'telescope'
vim.api.nvim_set_keymap('n', '<leader>sl', ':<C-u>SessionLoad<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':DashboardJumpMark<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cs', ':DashboardChangeColorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':DashboardFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':DashboardFindHistory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fw', ':DashboardFindWord<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nf', ':DashboardNewFile<CR>', { noremap = true, silent = true })
vim.g.dashboard_footer_icon = '🐬'
vim.g.dashboard_custom_shortcut = {
  last_session = 'SPC s l',
  find_history = 'SPC f h',
  find_file = 'SPC f f',
  new_file = 'SPC n f',
  change_colorscheme = 'SPC c s',
  find_word = 'SPC f w',
  book_marks = 'SPC f b',
}
vim.g.dashboard_custom_header = {
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
}

-- formatter.nvim
require('format')
vim.api.nvim_set_keymap('n', 'fm', ':w<CR>:Format<CR>', { noremap = true })

-- gitsigns.nvim
require('gitsigns').setup()

-- hop.nvim
require('hop').setup()
vim.api.nvim_set_keymap('n', 'mv', ':HopPattern<CR>', { noremap = true })

-- indent-blankline.nvim
vim.opt.list = true
require('indent_blankline').setup()
vim.g.indent_blankline_filetype_exclude = { 'dashboard' }

-- lualine.nvim
require('lualine').setup({
  options = {
    theme = 'dracula',
  },
})

-- markdown-preview.nvim
vim.g.mkdp_auto_start = 1

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

-- nvim-tree.lua
require('nvim-tree').setup()
vim.g.nvim_tree_indent_markers = 1
vim.api.nvim_set_keymap('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true })

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
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
})

-- onedark.nvim
require('onedark').load()

-- tabular
vim.api.nvim_set_keymap('v', '<leader><tab>', ':Tabularize /', { noremap = true })

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
vim.api.nvim_exec(
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
  false
)

-- vimtex
vim.opt.iskeyword:append(':')
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = 'abdmg'
vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex' }

-- vista
vim.g.vista_icon_indent = { '╰─▸ ', '├─▸ ' }
vim.g.vista_default_executive = 'ctags'
vim.g.vista_fzf_preview = { 'right:50%' }
vim.cmd('let g:vista#renderer#enable_icon = 1')
vim.api.nvim_set_keymap('n', 'tb', ':Vista<CR>', { noremap = true })
