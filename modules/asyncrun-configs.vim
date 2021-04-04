noremap R :call CompileRunGcc()<CR>
let g:asyncrun_open = 6
function! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    :AsyncRun -mode=term gcc -g -lm -Wall -std=c2x % -o %< && ./%<
  elseif &filetype == 'cpp'
    :AsyncRun -mode=term g++ -g -lm -Wall -std=c++20 % -o %< && ./%<
  elseif &filetype == 'go'
    :AsyncRun -mode=term go run %
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
