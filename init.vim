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
set signcolumn=number

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
    call dein#add('theniceboy/vim-deus')
    call dein#add('glepnir/dashboard-nvim')

    " Visualizer enhancement
    call dein#add('glepnir/spaceline.vim')
    call dein#add('Yggdroot/indentline')
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

    " UltiSnips
    call dein#add('honza/vim-snippets', { 'merged': 0, 'depends': 'coc.nvim' })

    " More vivid highlight enhancement for C++
    call dein#add('octol/vim-cpp-enhanced-highlight')

    " Go
    call dein#add('fatih/vim-go', { 'hook_post_update': ':GoInstallBinaries', 'on_ft': 'go' })

    " Python
    call dein#add('numirias/semshi', { 'hook_post_update': ':UpdateRemotePlugins', 'on_ft': 'python' })

    " AsyncRun
    call dein#add('skywind3000/asyncrun.vim', { 'on_cmd': 'AsyncRun' })

    " Debugger
    call dein#add('puremourning/vimspector', { 'on_ft': [ 'c', 'cpp', 'python', 'go' ],
                \ 'build': './install_gadget.py --enable-c --enable-python --enable-go' })

    " Find & Search
    call dein#add('brooth/far.vim', { 'on_cmd': ['F', 'Far', 'Fardo'] })
    call dein#add('liuchengxu/vim-clap', { 'hook_post_update': ':Clap install-binary!', 'on_cmd': '<C-u>Clap' })
    call dein#add('kevinhwang91/rnvimr', { 'on_cmd': 'RnvimrToggle' })

    " Auto Complete
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

    " Format
    call dein#add('godlygeek/tabular', { 'on_cmd': 'Tabularize'})
    call dein#add('chiel92/vim-autoformat', { 'on_cmd': 'Autoformat' })

    " Taglist
    call dein#add('liuchengxu/vista.vim', { 'on_cmd': 'Vista' })

    " Markdown
    call dein#add('iamcco/markdown-preview.nvim', { 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'sh -c "cd app & yarn install"' })
    call dein#add('dhruvasagar/vim-table-mode', { 'on_cmd': 'TableModeToggle', 'on_ft': ['text', 'markdown'] })

    " Html, CSS, JavaScript, TypeScript, JSON, etc.
    call dein#add('turbio/bracey.vim', { 'build': 'npm install --prefix server', 'on_ft': 'html' })
    call dein#add('othree/html5.vim')
    call dein#add('yuezk/vim-js')
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('posva/vim-vue')
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
hi NonText ctermfg=gray guifg=grey10
colorscheme deus

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
            \   'down': 10,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
nnoremap <F1> :call vimspector#StepInto()<CR>
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
let g:asyncrun_open = 6
function! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        :AsyncRun -mode=term clang -ggdb3 -Wall -std=c2x % -o %< && ./%<
    elseif &filetype == 'cpp'
        :AsyncRun -mode=term clang++ -ggdb3 -Wall -std=c++20 % -o %< && ./%<
    elseif &filetype == 'go'
        :AsyncRun -mode=term go run %
    elseif &filetype == 'html'
        exec "Bracey"
    elseif &filetype == 'javascript'
        :AsyncRun -mode=term node --trace-warnings %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'python'
        let $PYTHONNUNBUFFERED = 1
        :AsyncRun -mode=term -raw python %
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
" *** Dashboard & vim-clap
" ***
nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<CR>
nnoremap <silent> <Leader>nf :<C-u>DashboardNewFile<CR>
nnoremap <silent> <Leader>cc :<C-u>Clap colors<CR>
nnoremap <silent> <Leader>fw :<C-u>Clap grep2<CR>
nnoremap <silent> <Leader>fb :<C-u>Clap marks<CR>
let g:dashboard_default_header  = 'commicgirl6'
let g:dashboard_custom_shortcut = {
            \ 'last_session' : 'SPC s l',
            \ 'find_history' : 'SPC f h',
            \ 'find_file' : 'SPC f f',
            \ 'new_file' : 'SPC n f',
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
            \'coc-python',
            \'coc-snippets',
            \'coc-syntax',
            \'coc-tsserver',
            \'coc-tslint-plugin',
            \'coc-vimlsp',
            \'coc-vetur',
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
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
let g:snips_author     = 'Kino'
let g:coc_snippet_next = '<tab>'

nnoremap <silent> <leader>cc :CocCommand<CR>
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<CR>
