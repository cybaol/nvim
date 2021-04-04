let g:coc_global_extensions = [
            \'coc-actions',
            \'coc-cmake',
            \'coc-css',
            \'coc-diagnostic',
            \'coc-html',
            \'coc-json',
            \'coc-prettier',
            \'coc-pyright',
            \'coc-snippets',
            \'coc-syntax',
            \'coc-toml',
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
