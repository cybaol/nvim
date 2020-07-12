"aadhisxkfdssaikdweickndwi *******************************************************************
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
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.cache/dein/repos/github.com/Shougo/dein.vim'))
    silent !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
    silent !sh ~/installer.sh ~/.cache/dein
    silent !rm ~/installer.sh
endif

" change pip mirror
if empty(glob('~/.pip/pip.conf'))
    silent! exec "!mkdir ~/.pip"
    silent! exec "!cp ~/.config/nvim/default_configs/pip.conf ~/.pip/"
endif

" fish shell
if empty(glob('~/.config/fish/config.fish'))
    if empty(glob("~/.config/fish"))
        silent! exec "!mkdir ~/.config/fish"
    endif
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
filetype plugin indent on
set encoding=utf-8
set clipboard+=unnamedplus
" Prevent incorrect backgroung rendering
let &t_ut=''

" backup & temp file
set noundofile
set nobackup
set nowritebackup
set noswapfile

" ***
" *** Main code display
" ***
set number
set ruler
set cursorline
syntax enable
syntax on

" ***
" *** Editor behavior
" ***
" Better tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=7

" Prevent auto line split
set wrap
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ***
" *** Window behaviors
" ***
set splitright
set splitbelow

" ***
" *** Status/Command bar
" ***
set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                  " show a navigable menu for tab completion
set wildmode=longest,list,full

" Searching options
set hlsearch
exec ":nohlsearch"
set incsearch
set ignorecase
set smartcase

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

" ***
" *** Restore Cursor Position
" ***
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ***
" *** Basic Mappings
" ***

map ss :set nosplitright<CR>:vsplit<CR>
map st :vs term://$SHELL<CR>

noremap i k
noremap k j
noremap j h

" shift window
noremap H <C-w>h
noremap L <C-w>l
noremap K <C-w>k
noremap J <C-w>j

" copy to system clipboard
vnoremap Y "+y

map re /\(\<\w\+\>\)\_s*\1



" ***
" *** Plugins Install With Dein
" ***
let g:dein#auto_recache = 1

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('haya14busa/dein-command.vim')

    " Themes
    call dein#add('mhinz/vim-startify')
    call dein#add('tomasr/molokai')

    " Visualizer enhancement
    call dein#add('liuchengxu/eleline.vim')
    call dein#add('yggdroot/indentline')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('kristijanhusak/defx-icons')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('luochen1990/rainbow')

    " Clipboard bar
    call dein#add('junegunn/vim-peekaboo')

    " File navigation
    call dein#add('Shougo/defx.nvim')
    call dein#add('kristijanhusak/defx-git')
    call dein#add('mbbill/undotree', { 'on_event': 'UndotreeToggle' })

    " Quick comment & moving
    call dein#add('tpope/vim-commentary')
    call dein#add('easymotion/vim-easymotion', { 'on_map': '<Plug>(easymotion-overwin-f2)' })
    call dein#add('tpope/vim-surround')

    " Ultisnips
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')

    " More vivid highlight enhancement for C++
    call dein#add('octol/vim-cpp-enhanced-highlight')

    " Leetcode
    call dein#add('ianding1/leetcode.vim', { 'on_event': ['LeetCodeList', 'LeetCodeTest', 'LeetCodeSubmit', 'LeetCodeSignIn'] })

    " Quick Run
    call dein#add('skywind3000/asyncrun.vim', { 'on_func': '<SID>compile_and_run()' })

    " Local highlight in Python variable
    call dein#add('numirias/semshi', { 'on_ft': 'python' })

    " Debugger
    call dein#add('puremourning/vimspector', {'build': '~/.cache/dein/repos/github.com/puremourning/vimspector/install_gadget.py --enable-c --enable-python', 'on_ft': ['c', 'cpp', 'python'] })

    " Find & Search
    call dein#add('brooth/far.vim', { 'on_event': ['F', 'Far', 'Fardo'] })
    call dein#add('Yggdroot/LeaderF', { 'build': './install.sh' })
    call dein#add('francoiscabrol/ranger.vim', { 'depends': 'bclose.vim', 'on_event': 'Ranger' })
    call dein#add('rbgrouleff/bclose.vim', { 'on_event': 'Ranger' })

    " Auto Complete
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('neoclide/coc.nvim', { 'merged':0, 'rev': 'release'})

    " Format
    call dein#add('godlygeek/tabular', { 'on_event': 'Tabularize'})
    call dein#add('chiel92/vim-autoformat', { 'on_event': 'Autoformat' })

    " Taglist
    call dein#add('liuchengxu/vista.vim', { 'on_event': 'Vista' })

    " Markdown
    call dein#add('iamcco/markdown-preview.nvim', { 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'sh -c "cd app & yarn install"' })

    " HTML, CSS, JavaScript, JSON, etc.
    call dein#add('turbio/bracey.vim', { 'on_ft': 'html' })
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('pangloss/vim-javascript')
    call dein#add('yuezk/vim-js')
    call dein#add('MaxMEllon/vim-jsx-pretty')
    call dein#add('jelera/vim-javascript-syntax')
    call dein#add('elzr/vim-json')

    " Translator
    call dein#add('voldikss/vim-translator', { 'on_map': '<Plug>TranslateW' })

    " PDF Preview
    call dein#add('makerj/vim-pdf', { 'on_ft': 'pdf' })

    call dein#end()
    call dein#save_state()
endif

call plug#begin('~/.config/nvim/plugged')
call plug#end()

if dein#check_install()
    call dein#install()
endif



" " ***
" " *** Dress up my neovim
" " ***
set t_Co=256
set termguicolors    "enable true colors support"
colorscheme molokai
hi Function cterm=bold ctermfg=LightGray gui=bold

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
let g:cpp_no_function_highlight                   = 1
let c_no_curly_error                              = 1

" ***
" *** vimspector
" ***
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/vimspector-json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/vimspector-json',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
nnoremap <F7> :call vimspector#Reset()<CR>

" ***
" *** Leetcode
" ***
let g:leetcode_browser = 'firefox'
nnoremap <leader>ll :LeetCodeList<CR>
nnoremap <leader>lt :LeetCodeTest<CR>
nnoremap <leader>ls :LeetCodeSubmit<CR>
nnoremap <leader>li :LeetCodeSignIn<CR>

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
    " Open current file or toggle directory expand/collapse
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
" *** Ranger
" ***
let g:ranger_map_keys = 0
map ra :Ranger<CR>

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
" *** Html CSS3 JavaScript JSON
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
vnoremap <space><tab> :Tabularize<space>

" ***
" *** Ultisnips
" ***
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-z>"
let g:UltiSnipsSnippetDirectories  = [$HOME.'/.config/nvim/Ultisnips/']
let g:UltiSnipsUsePythonVersion    = 3

" ***
" *** Rainbow
" ***
let g:rainbow_active = 1

" ***
" *** Quick Run via R
" ***
nnoremap R :call <SID>compile_and_run()<CR>
function! s:compile_and_run()
    exec 'w'
    if &filetype == 'cpp'
        exec "AsyncRun! g++ -O3 -pthread -std=c++20 % -o %<; ./%<"
    elseif &filetype == 'c'
        exec "AsyncRun! gcc -O3 -pthread -std=c2x % -o %<; ./%<"
    elseif &filetype == 'python'
        exec "AsyncRun! python3 %"
    elseif &filetype == 'html'
        exec "AsyncRun! firefox % &"
    elseif &filetype == 'java'
        exec "AsyncRun! javac %; java %<"
    elseif &filetype == 'sh'
        exec "AsyncRun! bash %"
    endif
endfunction

let g:asyncrun_open = 15

" ***
" *** eleline
" ***
let g:airline_powerline_fonts = 0
" shift buffers
nnoremap b[ :bp<CR>
nnoremap [b :bp<CR>
nnoremap b] :bn<CR>
nnoremap ]b :bn<CR>
" close current buffer
noremap <C-x> :bd!<CR>

" ***
" *** Indentline
" ***
let g:indentLine_enabled    = 1
let g:indentLine_color_term = 255

" ***
" *** Vim-devicons
" ***
let g:webdevicons_enable_startify = 1

" ***
" *** Semshi
" ***
nmap <silent> rr :Semshi rename<CR>

" ***
" *** Translator
" ***
nmap <silent> ts <Plug>TranslateW

" ***
" *** Coc.nvim
" ***
set hidden
set updatetime=40
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-pairs', 'coc-yank', 'coc-vimlsp']

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
