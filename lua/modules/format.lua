require('formatter').setup({
  logging = false,
  filetype = {
    c = {
      function()
        return {
          exe = 'clang-format',
          args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
          stdin = true,
          cwd = vim.fn.expand('%:p:h'),
        }
      end,
    },
    cpp = {
      function()
        return {
          exe = 'clang-format',
          args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
          stdin = true,
          cwd = vim.fn.expand('%:p:h'),
        }
      end,
    },
    json = {
      function()
        return {
          exe = 'js-beautify',
          args = { '--indent-size', 2, vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    javascript = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--single-quote',
          },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--config-path',
            os.getenv('HOME') .. '/.config/nvim/static/stylua.toml',
            '--',
            '-',
          },
          stdin = true,
        }
      end,
    },
    markdown = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--single-quote',
          },
          stdin = true,
        }
      end,
    },
    python = {
      function()
        return {
          exe = 'black',
          args = {
            '--stdin-filename',
            vim.api.nvim_buf_get_name(0),
          },
          stdin = false,
        }
      end,
    },
    sh = {
      function()
        return {
          exe = 'shfmt',
          args = { '-i', 2, vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    verilog = {
      function()
        return {
          exe = 'verible-verilog-format',
          args = { '-' },
          stdin = true,
        }
      end,
    },
    systemverilog = {
      function()
        return {
          exe = 'verible-verilog-format',
          args = { '-' },
          stdin = true,
        }
      end,
    },
  },
})
