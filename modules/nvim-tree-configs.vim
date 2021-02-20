let g:nvim_tree_hide_dotfiles  = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_bindings = {
            \ 'edit':            ['<CR>'],
            \ 'toggle_dotfiles': 'zh',
            \ 'preview':         '<Tab>',
            \ 'cd':              'cd',
            \ 'create':          'a',
            \ 'remove':          'rm',
            \ 'rename':          'rn',
            \ 'cut':             'dd',
            \ 'copy':            'yy',
            \ 'paste':           'p',
            \ 'prev_git_item':   'k',
            \ 'next_git_item':   'j',
            \ 'dir_up':          '-',
            \ 'close':           'q',
            \ }
let g:nvim_tree_icons = {
            \ 'default': '',
            \ 'symlink': '',
            \ 'git': {
            \   'unstaged': "✚",
            \   'staged': "✚",
            \   'unmerged': "≠",
            \   'renamed': "≫",
            \   'untracked': "★"
            \   },
            \ }
nnoremap tt :NvimTreeToggle<CR>
