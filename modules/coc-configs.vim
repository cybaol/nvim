let g:coc_global_extensions = [
            \'coc-css',
            \'coc-diagnostic',
            \'coc-html',
            \'coc-json',
            \'coc-prettier',
            \'coc-pyright',
            \'coc-snippets',
            \'coc-syntax',
            \'coc-tsserver',
            \'coc-vimlsp',
            \'@yaegassy/coc-volar',
            \'coc-xmake',
            \'coc-yank',
            \]
" To show documentation details
nnoremap <silent> ? :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('?', 'in')
  endif
endfunction

" code jump
function! s:goto_tag(tagkind) abort
  let tagname = expand('<cWORD>')
  let winnr = winnr()
  let pos = getcurpos()
  let pos[0] = bufnr()
  " NOTE: use <C-t> to back operations
  if CocAction('jump' . a:tagkind)
    call settagstack(winnr, {
            \ 'curidx': gettagstack()['curidx'],
            \ 'items': [{'tagname': tagname, 'from': pos}]
            \ }, 't')
  endif
endfunction
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> gd :call <SID>goto_tag("Definition")<CR>
nmap <silent> gi :call <SID>goto_tag("Implementation")<CR>
nmap <silent> gr :call <SID>goto_tag("References")<CR>

" coc-diagnostic
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" code completion
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
let g:snips_author     = 'Kino'
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" float scroll
nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

nnoremap <silent> <leader>cc :CocCommand<CR>
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<CR>
