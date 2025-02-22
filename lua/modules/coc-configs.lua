vim.g.coc_global_extensions = {
  'coc-css',
  'coc-diagnostic',
  'coc-html',
  'coc-json',
  'coc-prettier',
  'coc-pyright',
  'coc-snippets',
  'coc-syntax',
  'coc-tsserver',
  'coc-vimlsp',
  '@yaegassy/coc-volar',
  'coc-xmake',
  'coc-yank',
}

local keyset = vim.keymap.set

-- To show documentation details
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end
keyset('n', '?', '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Code Navigation
local function goto_tag(tagkind)
  local tagname = vim.fn.expand("<cWORD>")
  local winnr = vim.fn.winnr()
  local pos = vim.fn.getcurpos()
  pos[1] = vim.fn.bufnr()

  if not vim.fn.CocAction("jump" .. tagkind) then
    return
  end

  local ts = vim.fn.gettagstack(winnr)
  vim.fn.settagstack(winnr, {
    curidx = ts.curidx,
    items = { { tagname = tagname, from = pos } }
  }, 't')
end
keyset('n', 'rn', '<Plug>(coc-rename)', { silent = true })
keyset('n', 'gd', function() goto_tag('Definition') end, { silent = true })
keyset('n', 'gi', function() goto_tag('Implementation') end, { silent = true })
keyset('n', 'gr', function() goto_tag('References') end, { silent = true })

-- Coc Diagnostics
keyset('n', '<leader>-', '<Plug>(coc-diagnostic-prev)', { silent = true })
keyset('n', '<leader>=', '<Plug>(coc-diagnostic-next)', { silent = true })

-- Code Completion
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
vim.g.snips_author = 'Kino'
vim.g.coc_snippet_next = '<tab>'
vim.g.coc_snippet_prev = '<s-tab>'

-- Float Scroll
local opts_ = { silent = true, nowait = true, expr = true }
keyset('n', '<C-j>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-j>"', opts_)
keyset('n', '<C-k>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-k>"', opts_)
keyset('i', '<C-j>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts_)
keyset('i', '<C-k>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts_)

-- Other KeyMap
keyset('n', '<leader>cc', ':CocCommand<CR>', { silent = true })
keyset('n', '<leader>y', ':<C-u>CocList -A --normal yank<CR>', { silent = true })
