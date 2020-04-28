
" ***
" *** Auto Load With First Uses
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

source ~/.config/nvim/_machine_specific.vim


"***
" *** System
" ***
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus
" Prevent incorrect backgroung rendering
let &t_ut=''

" backup & temp file
set noundofile
set nobackup
set noswapfile

" ***
" *** Main code display
" ***
set number
set relativenumber
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
map ss :set nosplitright<CR>:vsplit<CR>

" ***
" *** Status/command bar
" ***
set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
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
" *** Terminal Behaviors
" ***
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ***
" *** Basic Mappings
" ***

"change word to uppercase
inoremap <C-u> <esc>gUiwea

" <caps> -> <esc>
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

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

map <LEADER>re /\(\<\w\+\>\)\_s*\1

" ***
" *** Quick Run via <F10>
" ***
map <F10> :call CompileRunGcc()<CR>
function! CompileRunGcc()
  exec "w"
  if &filetype == 'cpp'
    exec "!g++ -O3 -std=c++11 % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'c'
    exec "!gcc -O3 -std=c11 % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunction



" ***
" *** Plugin Install With Vim-Plug
" ***

call plug#begin('~/.config/nvim/plugged')
" Themes
Plug 'mhinz/vim-startify'
Plug 'connorholyday/vim-snazzy'

" Visualizer enhancement
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'

" Clipboard bar
Plug 'junegunn/vim-peekaboo'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', {'do' : {-> fzf#install()} }
Plug 'francoiscabrol/ranger.vim'

" Undo Tree
Plug 'mbbill/undotree'

" Local highlight in python variable
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Debuger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Find & Search
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Format
Plug 'tell-k/vim-autopep8'
Plug 'godlygeek/tabular'

"Tag bar navigation
Plug 'majutsushi/tagbar'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }

call plug#end()



" ***
" *** theme settings
" ***
set termguicolors "enable true colors support"
let g:SnazzyTransparent = 1
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }
colorscheme snazzy

" ***
" *** Nerd Tree
" ***
let NERDTreeHighlightCursorline = 1
let NERDTreeShowLineNumbers     = 1
let NERDTreeChDirMode           = 1
let NERDTreeShowBookmarks       = 1
let NERDTreeWinSize             = 25
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
map nt :NERDTreeToggle<CR>

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
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunction

" ***
" *** FZF
" ***
map <C-f> :FZF<CR>

" ***
" *** You Complete Me
" ***
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_use_clangd                                = 0
let g:ycm_python_binary_path = g:ycm_python_interpreter_path

" ***
" *** Tagbar navigation
" ***
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width     = 30
let g:tagbar_autofocus = 1
let g:tagbar_left      = 1
map tb :TagbarToggle<CR>

" ***
" *** Emmet
" ***
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstal
let g:user_emmet_leader_key='<C-m>' " shift key

" ***
" *** Autopep8
" ***
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" ***
" *** Tabular
" ***
vnoremap <tab> :Tabularize 

" ***
" *** Vim-bookmarks
" ***
let g:bookmark_no_default_key_mappings = 1
nmap bm <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mi <Plug>BookmarkNext
nmap mn <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save            = 1
let g:bookmark_highlight_lines      = 1
let g:bookmark_manage_per_buffer    = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center               = 1
let g:bookmark_auto_close           = 1
let g:bookmark_location_list        = 1

" ***
" *** airline
" ***
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'
" show status bar icon
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" <leader>1~9 shift buffer 1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" ***
" *** Indentline
" ***
let g:indentLine_enabled    = 1
let g:indentLine_setColors  = 1
let g:indentLine_color_term = 255

" ***
" *** Coc.nvim
" ***
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-css', 'coc-python', 'coc-highlight', 'coc-yank', 'coc-vimlsp', 'coc-diagnostic']
set statusline^=%{coc#status()}
" Use ? to show documentation in preview window
nnoremap ? :call <SID>show_documentation()<CR>
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

nnoremap <silent> y<space> :<C-u>CocList -A --normal yank<cr>

