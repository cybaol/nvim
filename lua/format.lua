require'formatter'.setup {
  logging = false,
  filetype = {
    c = {
      function()
        return {
          exe = "clang-format",
          args = {"--style", "google", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {"--style", "google", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    html = {
      function()
        return {
          exe = "js-beautify",
          args = {"--indent-size", 2, vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    json = {
      function()
        return {
          exe = "js-beautify",
          args = {"--indent-size", 2, vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'
          },
          stdin = true
        }
      end
    },
    lua = {
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdio"},
          stdin = true
        }
      end
    },
    markdown = {
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'
          },
          stdin = true
        }
      end
    },
    sh = {
      function()
        return {
          exe = "shfmt",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    typescript = {
      function()
        return {
          exe = "clang-format",
          args = {"--style", "google", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    }
  }
}
