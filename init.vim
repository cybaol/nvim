" *******************************************************************
"                              My Neovim
"        Author      : Kino
"        Email       : cybao292261@163.com
"        Address     : github.com/cybaol/nvim
"        Description : these configs can make your work productive
"
"               CopyRight (C) 2020 All Rights Reserved
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

" fish shell
if empty(glob('~/.config/fish/config.fish'))
    silent! exec "!mkdir -p ~/.config/fish"
    silent! exec "!cp ~/.config/nvim/default_configs/config.fish ~/.config/fish/"
    silent! exec "!source ~/.config/fish/config.fish"
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
set tabstop=4
set shiftwidth=4
set smartindent
set softtabstop=-1

set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=4
set lazyredraw
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

set splitright
set splitbelow
set ttyfast

set autochdir
set formatoptions-=tc
set laststatus=2
set showcmd
set noshowmode
set wildmenu
set wildmode=longest:list,full

set hlsearch
set incsearch
set ignorecase
set smartcase
set regexpengine=1

set hidden
set updatetime=40
set shortmess+=c
set signcolumn=yes
set cmdheight=2

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
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('Shougo/dein.vim')

    " Themes
    call dein#add('hardcoreplayers/dashboard-nvim')
    call dein#add('dracula/vim', { 'name': 'dracula' })
    call dein#add('frankier/neovim-colors-solarized-truecolor-only')

    " Visualizer enhancement
    call dein#add('bling/vim-bufferline')
    call dein#add('vim-airline/vim-airline')
    call dein#add('Yggdroot/indentline')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('kristijanhusak/defx-icons')
    call dein#add('kristijanhusak/defx-git')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('luochen1990/rainbow')

    " File navigation
    call dein#add('Shougo/defx.nvim')
    call dein#add('mbbill/undotree', { 'on_event': 'UndotreeToggle' })

    " Quick comment & moving
    call dein#add('tpope/vim-commentary')
    call dein#add('easymotion/vim-easymotion', { 'on_map': '<Plug>(easymotion-overwin-f2)' })
    call dein#add('tpope/vim-surround')

    " UltiSnips
    call dein#add('honza/vim-snippets', { 'merged': 0 })

    " More vivid highlight enhancement for C++
    call dein#add('octol/vim-cpp-enhanced-highlight')

    " Python
    call dein#add('numirias/semshi', { 'hook_post_update': ':UpdateRemotePlugins', 'on_ft': 'python' })

    " Debugger
    call dein#add('puremourning/vimspector', {'build': './install_gadget.py --enable-c --enable-python', 'on_ft': ['c', 'cpp', 'python'] })

    " Find & Search
    call dein#add('brooth/far.vim')
    call dein#add('liuchengxu/vim-clap', { 'hook_post_update': ':Clap install-binary!' })
    call dein#add('kevinhwang91/rnvimr', { 'on_event': 'RnvimrToggle' })

    " Auto Complete
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

    " Format
    call dein#add('godlygeek/tabular', { 'on_event': 'Tabularize'})
    call dein#add('chiel92/vim-autoformat', { 'on_event': 'Autoformat' })

    " Taglist
    call dein#add('liuchengxu/vista.vim', { 'on_event': 'Vista' })

    " Markdown
    call dein#add('iamcco/markdown-preview.nvim', { 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'sh -c "cd app & yarn install"' })
    call dein#add('dhruvasagar/vim-table-mode', { 'on_event': 'TableModeToggle', 'on_ft': ['text', 'markdown'] })

    " HTML, CSS, JavaScript, JSON, etc.
    call dein#add('turbio/bracey.vim', { 'build': 'npm install --prefix server', 'on_ft': ['html', 'css', 'javascript'] })
    call dein#add('othree/html5.vim')
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('pangloss/vim-javascript')
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
set background=dark
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 1

" ***
" *** cpp highlight enhanced
" ***
let g:cpp_class_scope_highlight                   = 1
let g:cpp_member_variable_highlight               = 1
let g:cpp_class_decl_highlight                    = 1
let g:cpp_posix_standard                          = 1
"let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight         = 1
let g:cpp_concepts_highlight                      = 1
let g:cpp_no_function_highlight                   = 0
let c_no_curly_error                              = 1

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
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
nnoremap <F7> :call vimspector#Reset()<CR>

" ***
" *** Defx.nvim
" ***
call defx#custom#option('_', {
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
" *** Far
" ***
nnoremap <c-f> :F  %<left><left>

" ***
" *** Ranger
" ***
let g:rnvimr_enable_ex = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> ra :RnvimrToggle<CR>

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
" *** Html CSS JavaScript JSON
" ***
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

" ***
" *** Autoformat
" ***
nnoremap fm :Autoformat<CR>

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
function! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -Os -ggdb3 -fomit-frame-pointer -Wall -pthread -std=c2x -m64 % -o %<; ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ -Os -ggdb3 -fomit-frame-pointer -Wall -pthread -std=c++20 -m64 % -o %<; ./%<"
    elseif &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'html'
        exec "Bracey"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'sh'
        :!bash %
    endif
endfunction

" ***
" *** Airline
" ***
let g:airline_powerline_fonts = 1
let g:bufferline_echo         = 0
let g:airline_theme           = 'dracula'

" ***
" *** Dashboard & vim-clap
" ***
nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<CR>
nnoremap <silent> <Leader>cc :<C-u>Clap colors<CR>
nnoremap <silent> <Leader>fw :<C-u>Clap grep2<CR>
nnoremap <silent> <Leader>fb :<C-u>Clap marks<CR>
let g:dashboard_default_header  = 'commicgirl6'
let g:dashboard_custom_shortcut = {
            \ 'last_session' : 'SPC s l',
            \ 'find_history' : 'SPC f h',
            \ 'find_file' : 'SPC f f',
            \ 'change_colorscheme' : 'SPC c c',
            \ 'find_word' : 'SPC f w',
            \ 'book_marks' : 'SPC f b',
            \ }
let g:clap_theme  = 'material_design_dark'
let g:clap_layout = { 'relative': 'editor' }

" ***
" *** Indentline
" ***
let g:indentLine_char            = '┆'
let g:indentLine_color_term      = 239
let g:indentLine_bgcolor_term    = 202
let g:indentLine_fileTypeExclude = ['dashboard', 'defx', 'vista']

" ***
" *** Vim-devicons
" ***
let g:webdevicons_enable                    = 1
let g:webdevicons_enable_airline_statusline = 1

" ***
" *** Semshi
" ***
nmap <silent> rr :Semshi rename<CR>

" ***
" *** Translator
" ***
nmap <silent> ts <Plug>TranslateW
vmap <silent> ts <Plug>TranslateWV

" ***
" *** Coc.nvim
" ***
let g:coc_global_extensions = [
            \'coc-actions',
            \'coc-css',
            \'coc-diagnostic',
            \'coc-html',
            \'coc-json',
            \'coc-pairs',
            \'coc-python',
            \'coc-snippets',
            \'coc-syntax',
            \'coc-tsserver',
            \'coc-vimlsp',
            \'coc-yank',
            \]
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" To show documentation details
nnoremap <silent> ? :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)
nmap <silent> rn <Plug>(coc-rename)

" coc-snippets
imap <tab> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

nnoremap <silent> <leader>y :<C-u>CocList -A --normal yank<CR>
