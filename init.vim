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
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" change pip mirror
if empty(glob('~/.pip/pip.conf'))
    silent! exec "!mkdir ~/.pip"
    silent! exec "!cp ~/.config/nvim/default_configs/pip.conf ~/.pip/"
endif

" cpp debugger configs
if empty(glob('~/.vimspector.json'))
    silent! exec "!cp ~/.config/nvim/default_configs/vimspector_cpp.json ~/.vimspector.json"
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
" *** Status/command bar
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

"change word to uppercase
inoremap <C-u> <esc>gUiwea

" <caps> -> <esc>
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

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
" *** Plugins Install With Vim-Plug
" ***

call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'mhinz/vim-startify'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'

" Visualizer enhancement
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'

" Clipboard bar
Plug 'junegunn/vim-peekaboo'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'

" Ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" More vivid highlight enhancement for C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Quick Run
Plug 'skywind3000/asyncrun.vim'

" Local highlight in Python variable
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Debugger
Plug 'puremourning/vimspector', {'do': '~/.config/nvim/plugged/vimspector/install_gadget.py --enable-c --enable-python'}

" Find & Search
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'junegunn/fzf', {'do' : {-> fzf#install()} }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'francoiscabrol/ranger.vim'

" Undo Tree
Plug 'mbbill/undotree'

" Auto Complete
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Format
Plug 'godlygeek/tabular'
Plug 'chiel92/vim-autoformat'

" Taglist
Plug 'liuchengxu/vista.vim'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'elzr/vim-json'

" PDF preview
Plug 'makerj/vim-pdf'

call plug#end()



" ***
" *** Dress up my neovim
" ***
set termguicolors    "enable true colors support"
colorscheme dracula

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
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
nnoremap <F7> :call vimspector#Reset()<CR>

" ***
" *** Nerd Tree
" ***
let NERDTreeHighlightCursorline = 1
let NERDTreeShowLineNumbers     = 1
let NERDTreeChDirMode           = 1
let NERDTreeShowBookmarks       = 1
let NERDTreeWinSize             = 40
map nt :NERDTreeToggle<CR>

" ***
" *** NerdTree-git-plugin
" ***
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

" ***
" *** Nerdcommenter
" ***
map c<space> <leader>c<space>

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
" *** FZF
" ***
map <C-f> :FZF<CR>

" ***
" *** Vista.vim
" ***
nnoremap tb :Vista<CR>
let g:vista_icon_indent          = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive    = 'ctags'
let g:vista_fzf_preview          = ['right:50%']
let g:vista#renderer#enable_icon = 1
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" ***
" *** Html CSS3 JavaScript PHP JSON
" ***
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

" ***
" *** autoformat
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
" *** rainbow
" ***
let g:rainbow_active = 1

" ***
" *** Quick Run via R
" ***
nnoremap R :call <SID>compile_and_run()<CR>
function! s:compile_and_run()
    exec 'w'
    if &filetype == 'cpp'
        exec "AsyncRun! g++ -O3 -lpthread -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'c'
        exec "AsyncRun! gcc -O3 -lpthread -std=c11 % -o %<; time ./%<"
    elseif &filetype == 'python'
        exec "AsyncRun! time python3 %"
    elseif &filetype == 'html'
        exec "AsyncRun! chromium % &"
    elseif &filetype == 'java'
        exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
        exec "AsyncRun! time bash %"
    endif
endfunction

let g:asyncrun_open = 15

" ***
" *** Airline
" ***
let g:airline_powerline_fonts            = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme                      = 'deus'
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
let g:webdevicons_enable_nerdtree           = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline    = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_startify           = 1

" ***
" *** Semshi
" ***
nmap <silent> rr :Semshi rename<CR>

" ***
" *** Coc.nvim
" ***
set hidden
set updatetime=40
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-pairs', 'coc-vimlsp']

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

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
