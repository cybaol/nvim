" *******************************************************************
"                              My Neovim
"        Author      : Kino
"        Email       : cybao292261@163.com
"        Address     : github.com/cybaol/nvim
"        Description : these configs can make your work productive
"
"               CopyRight (C) 2020-2025 All Rights Reserved
" *******************************************************************

" ***
" *** Auto Load for First Usage
" ***
if empty(glob('~/.cache/dein/repos/github.com/Shougo/dein.vim'))
    silent !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
    silent !sh ~/installer.sh ~/.cache/dein
    silent !rm ~/installer.sh
endif

" change pip mirror
if empty(glob('~/.pip/pip.conf'))
    silent! exec "!mkdir -p ~/.pip"
    silent! exec "!cp ~/.config/nvim/default_configs/pip.conf ~/.pip/"
endif

source ~/.config/nvim/_machine_specific.vim



" ***
" *** System
" ***
set nocompatible
filetype on
filetype indent on
filetype plugin on
set encoding=utf-8
set clipboard+=unnamedplus
let &t_ut=''

set noundofile
set nobackup
set nowritebackup
set noswapfile

set number
set relativenumber
set ruler
set cursorline
syntax on

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent

set list
set listchars=tab:\¦\ ,trail:▫ " related to NonText "
set scrolloff=4
set lazyredraw
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

set splitright
set splitbelow
set ttyfast
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set autochdir
set formatoptions-=tc
set laststatus=2
set showcmd
set noshowmode
set wildmenu

set hlsearch
set incsearch
set ignorecase
set smartcase
set regexpengine=1

set hidden
set updatetime=100
set shortmess+=c
set signcolumn=yes

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" ***
" *** Basic Mappings
" ***
let mapleader = " "

let g:neoterm_autoscroll = 1
map ss :set nosplitright<CR>:vsplit<CR>
map st :vs term://$SHELL<CR>
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

noremap i <PageUp>
noremap k <PageDown>
noremap j h

" shift buffers
nnoremap bp :bp<CR>
nnoremap bn :bn<CR>
" close current buffer
noremap <C-x> :bd!<CR>

" shift window
noremap H <C-w>h
noremap L <C-w>l
noremap K <C-w>k
noremap J <C-w>j

" global replacement
nnoremap <leader>r :%s///g<left><left><left>

" copy to system clipboard
vnoremap Y "+y

nnoremap <leader><CR> :nohlsearch<CR>

" update all plugins with dein.vim
nnoremap U :call dein#update()<CR>



" ***
" *** Plugins Install With Dein
" ***
let g:dein#auto_recache = 1
let g:dein#install_max_processes = 16
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('Shougo/dein.vim')

    " Themes
    call dein#add('ajmwagar/vim-deus')
    call dein#add('glepnir/dashboard-nvim')

    " Visualizer enhancement
    call dein#add('glepnir/spaceline.vim')
    call dein#add('Yggdroot/indentLine')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('kristijanhusak/defx-icons')
    call dein#add('kristijanhusak/defx-git')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('luochen1990/rainbow')

    " File navigation
    call dein#add('Shougo/defx.nvim')
    call dein#add('mbbill/undotree', { 'on_cmd': 'UndotreeToggle' })

    " Quick comment & moving
    call dein#add('tpope/vim-commentary')
    call dein#add('easymotion/vim-easymotion', { 'on_map': '<Plug>(easymotion-overwin-f2)' })
    call dein#add('tpope/vim-surround')
    call dein#add('gcmt/wildfire.vim')

    " UltiSnips
    call dein#add('honza/vim-snippets', { 'merged': 0, 'depends': 'coc.nvim' })

    " Syntax highlight enhancement
    call dein#add('nvim-treesitter/nvim-treesitter', { 'hook_post_update': ':TSUpdate' })

    " Go
    call dein#add('fatih/vim-go', { 'on_ft': 'go', 'hook_post_update': ':GoInstallBinaries' })

    " Python
    call dein#add('Vimjas/vim-python-pep8-indent', { 'on_ft': 'python' })
    call dein#add('numirias/semshi', { 'on_ft': 'python', 'hook_post_update': ':UpdateRemotePlugins' })

    " Latex
    call dein#add('lervag/vimtex', { 'on_ft': 'tex' })
    call dein#add('KeitaNakamura/tex-conceal.vim')

    " AsyncRun
    call dein#add('skywind3000/asyncrun.vim', { 'on_cmd': 'AsyncRun' })

    " Debugger
    call dein#add('puremourning/vimspector', { 'on_ft': [ 'c', 'cpp', 'python', 'go' ],
                \ 'hook_post_update': ':VimspectorUpdate vscode-cpptools debugpy vscode-go' })

    " Find & Search
    call dein#add('brooth/far.vim', { 'on_cmd': ['F', 'Far', 'Fardo'] })
    call dein#add('junegunn/fzf.vim')
    call dein#add('kevinhwang91/rnvimr', { 'on_cmd': 'RnvimrToggle' })

    " Auto Complete
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

    " Format
    call dein#add('godlygeek/tabular', { 'on_cmd': 'Tabularize'})
    call dein#add('google/vim-maktaba', { 'merged': 0 })
    call dein#add('google/vim-codefmt')

    " Taglist
    call dein#add('liuchengxu/vista.vim', { 'on_cmd': 'Vista' })

    " Markdown
    call dein#add('iamcco/markdown-preview.nvim', { 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'sh -c "cd app & yarn install"' })
    call dein#add('dhruvasagar/vim-table-mode', { 'on_ft': ['text', 'markdown'], 'on_cmd': 'TableModeToggle' })

    " Html, CSS, JavaScript, TypeScript, JSON, etc.
    call dein#add('turbio/bracey.vim', { 'on_ft': 'html', 'build': 'npm install --prefix server' })
    call dein#add('othree/html5.vim')
    call dein#add('yuezk/vim-js')
    call dein#add('elzr/vim-json')

    " Translator
    call dein#add('voldikss/vim-translator', { 'on_map': ['<Plug>TranslateW', '<Plug>TranslateWV'] })

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif



" ***
" *** Dress up my neovim
" ***
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme deus
hi Conceal ctermfg=gray guifg=grey10
hi NonText ctermfg=gray guifg=grey10

" ***
" *** nvim-treesitter
" ***
source ~/.config/nvim/modules/nvim-treesitter.vim

" ***
" *** vimspector
" ***
let g:vimspector_enable_mappings   = 'HUMAN'
let g:vimspector_terminal_minwidth = 35
function! s:read_template_into_buffer(template)
    execute '0r ~/.config/nvim/vimspector-json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/vimspector-json',
            \   'down': 10,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
nnoremap <F7> :call vimspector#Reset()<CR>

" ***
" *** Defx.nvim
" ***
call defx#custom#option('_', {
            \ 'resume': 1,
            \ 'columns': 'indent:git:icons:filename',
            \ 'winwidth': 35,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'listed': 1,
            \ 'show_ignored_files': 0,
            \ 'root_marker': '≡ ',
            \ })

nnoremap <silent> ;e :Defx<CR>

function! s:defx_mappings() abort
    setl number
    nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> zh    defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> mk    defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> nf    defx#do_action('new_file')
    nnoremap <silent><buffer><expr> cd    defx#do_action('open')
    nnoremap <silent><buffer><expr> dd    defx#do_action('remove')
    nnoremap <silent><buffer><expr> pp    defx#do_action('paste')
    nnoremap <silent><buffer><expr> rn    defx#do_action('rename')
    nnoremap <silent><buffer><expr> yy    defx#do_action('copy')
    nnoremap <silent><buffer><expr> yp    defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> a     defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> q     defx#do_action('quit')
    nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k     line('.') == 1 ? 'G' : 'k'
endfunction

function! s:defx_toggle_tree() abort
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

autocmd FileType defx call s:defx_mappings()

" ***
" *** Defx-git
" ***
let g:defx_git#indicators = {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '✖',
            \ 'Ignored'   : '☒',
            \ 'Unknown'   : '?'
            \ }

let g:defx_git#column_length = 0

" ***
" *** GitGutter
" ***
let g:gitgutter_map_keys             = 0
let g:gitgutter_sign_allow_clobber   = 0
let g:gitgutter_preview_win_floating = 1
nnoremap <leader>gf :GitGutterFold<CR>

" ***
" *** Far
" ***
nnoremap <c-f> :F  %<left><left>

" ***
" *** vim-go
" ***
let g:go_echo_go_info                        = 0
let g:go_doc_popup_window                    = 1
let g:go_def_mapping_enabled                 = 0
let g:go_template_autocreate                 = 0
let g:go_textobj_enabled                     = 0
let g:go_auto_type_info                      = 1
let g:go_def_mapping_enabled                 = 0
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_format_strings            = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types                     = 1
let g:go_highlight_variable_assignments      = 0
let g:go_highlight_variable_declarations     = 0
let g:go_doc_keywordprg_enabled              = 0

" ***
" *** Vimtex
" ***
set iskeyword+=:
let g:tex_flavor                      = 'latex'
let g:vimtex_view_method              = 'zathura'
let g:vimtex_quickfix_mode            = 0
set conceallevel=2
let g:tex_conceal                     = 'abdmg'
let g:vimtex_compiler_latexmk_engines = { '_': '-xelatex' }
autocmd FileType tex highlight Conceal ctermfg=168 guifg=#FF8C00

" ***
" *** Rnvimr
" ***
let g:rnvimr_enable_ex   = 1
let g:rnvimr_pick_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> ra :RnvimrToggle<CR>
let g:rnvimr_layout  = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" ***
" *** vim-easymotion
" ***
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade   = 0
let g:EasyMotion_smartcase  = 1
nmap mv <Plug>(easymotion-overwin-f2)

" ***
" *** Undotree
" ***
noremap ud :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen       = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators    = 1
let g:undotree_WindowLayout       = 2
let g:undotree_DiffpanelHeight    = 8
let g:undotree_SplitWidth         = 24

" ***
" *** Vista.vim
" ***
nnoremap tb :Vista<CR>
let g:vista_icon_indent          = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive    = 'ctags'
let g:vista_fzf_preview          = ['right:50%']
let g:vista#renderer#enable_icon = 1

" ***
" *** Vim-codefmt
" ***
nnoremap fm :FormatCode<CR>

" ***
" *** Tabular
" ***
vmap <leader><tab> :Tabularize /

" ***
" *** vim-table-mode
" ***
noremap <leader>tm :TableModeToggle<CR>

" ***
" *** Rainbow
" ***
let g:rainbow_active = 1

" ***
" *** Compile function
" ***
noremap R :call CompileRunGcc()<CR>
let g:asyncrun_open = 6
function! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        :AsyncRun -mode=term clang -ggdb3 -Wall -std=c2x % -o %< && ./%<
    elseif &filetype == 'cpp'
        :AsyncRun -mode=term clang++ -ggdb3 -Wall -std=c++20 % -o %< && ./%<
    elseif &filetype == 'go'
        :AsyncRun -mode=term go run .
    elseif &filetype == 'html'
        exec "Bracey"
    elseif &filetype == 'javascript'
        :AsyncRun -mode=term node --trace-warnings %
    elseif &filetype == 'lua'
        :AsyncRun -mode=term lua %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'python'
        let $PYTHONNUNBUFFERED = 1
        :AsyncRun -mode=term -raw python3 %
    elseif &filetype == 'sh'
        :AsyncRun -mode=term bash %
    endif
endfunction

" ***
" *** Spaceline
" ***
let g:spaceline_custom_diff_icon = ['+','~','-']
let g:spaceline_diff_tool        = 'git-gutter'
let g:spaceline_git_branch_icon  = ''
let g:spaceline_function_icon    = ''

" ***
" *** Dashboard & FZF
" ***
let g:dashboard_default_executive = 'fzf'
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>nf :DashboardNewFile<CR>
nnoremap <silent> <Leader>cs :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fw :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
let g:dashboard_default_header  = 'commicgirl6'
let g:dashboard_custom_shortcut = {
            \ 'last_session' : 'SPC s l',
            \ 'find_history' : 'SPC f h',
            \ 'find_file' : 'SPC f f',
            \ 'new_file' : 'SPC n f',
            \ 'change_colorscheme' : 'SPC c s',
            \ 'find_word' : 'SPC f w',
            \ 'book_marks' : 'SPC f b',
            \ }

" ***
" *** Indentline
" ***
let g:indentLine_setColors       = 0
let g:indentLine_setConceal      = 0
let g:indentLine_color_term      = 239
let g:indentLine_bgcolor_term    = 202
let g:indentLine_fileTypeExclude = ['dashboard', 'defx', 'tex', 'vista']

" ***
" *** Semshi
" ***
nmap <silent> rr :Semshi rename<CR>

" ***
" *** Translator
" ***
nmap <silent> ts <Plug>TranslateW
vmap <silent> ts <Plug>TranslateWV
let g:translator_default_engines = ['google']

" ***
" *** Coc.nvim
" ***
let g:coc_global_extensions = [
            \'coc-actions',
            \'coc-css',
            \'coc-diagnostic',
            \'coc-html',
            \'coc-json',
            \'coc-prettier',
            \'coc-pyright',
            \'coc-snippets',
            \'coc-syntax',
            \'coc-tslint-plugin',
            \'coc-tsserver',
            \'coc-vimlsp',
            \'coc-vimtex',
            \'coc-yank',
            \]
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" To show documentation details
nnoremap <silent> ? :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" some powerful mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)
nmap <silent> rn <Plug>(coc-rename)

" coc-diagnostic
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" coc-snippets
imap <tab> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:snips_author     = 'Kino'
let g:coc_snippet_next = '<tab>'

" float scroll
nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

nnoremap <silent> <leader>cc :CocCommand<CR>
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<CR>
