" requires neovim 0.5+
lua << EOF
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "cpp", "typescript" },
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    }
}
EOF
