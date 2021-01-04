" requires neovim 0.5+
lua << EOF
require 'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}
EOF
