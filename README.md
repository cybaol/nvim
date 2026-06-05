# Neovim Development Environment

[![lazy.nvim](https://img.shields.io/badge/Plugin%20Manager-lazy.nvim-blue)](https://github.com/folke/lazy.nvim)
[![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-green)](https://neovim.io)

> A full-featured Neovim configuration powered by [lazy.nvim](https://github.com/folke/lazy.nvim), designed for developers who need a rich IDE-like experience out of the box.

[**中文文档**](README-cn.md)

---

## 📦 Project Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── lua/
│   ├── plugins.lua           # Plugin declarations
│   ├── plugin-configs.lua    # Plugin configurations
│   ├── core/
│   │   ├── options.lua       # Core options
│   │   └── mappings.lua      # Global keymaps
│   └── modules/
│       ├── coc-configs.lua   # coc.nvim configuration
│       ├── compile.lua       # C/C++/CUDA build script
│       └── format.lua        # Formatting configuration
├── coc-settings.json         # LSP settings
├── vimspector-json/          # Debugger templates
└── static/stylua.toml        # StyLua configuration
```

---

## 🚀 Quick Start

### Prerequisites

```bash
# Arch Linux
sudo pacman -S neovim nodejs lua-penlight ctags clang yarn shfmt python-black prettier styua
yay -S nodejs-neovim cmake-language-server svlangserver js-beautify
```

### Installation

```bash
git clone https://github.com/cybaol/nvim.git ~/.config/nvim
nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) will automatically install all plugins and Treesitter parsers.

---

## 🔑 Keymaps Quick Reference

### Window / Buffer / Terminal

| Keymap | Action |
|--------|--------|
| `H` `J` `K` `L` | Window left / down / up / right |
| `tt` | Open vertical split terminal |
| `<C-n>` (terminal) | Return to normal mode |
| `bp` / `bn` | Previous / next buffer |
| `<C-x>` | Close current buffer |

### Code Editing

| Keymap | Action |
|--------|--------|
| `fm` | Save and format |
| `<leader>r` | Global search and replace (`:%s///g`) |
| `<leader><cr>` | Clear search highlighting |
| `<leader>tm` | Toggle table mode |
| `i` / `k` / `j` / `l` | PageUp / PageDown / Move left / Move right |

### Completion & LSP (coc.nvim)

| Keymap | Action |
|--------|--------|
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `rn` | Rename symbol |
| `?` | Show documentation |
| `<Tab>` `<S-Tab>` | Navigate completion menu |
| `<leader>-` `<leader>=` | Previous / next diagnostic |
| `<C-j>` `<C-k>` | Scroll floating window |

### AI Completion (Windsurf)

| Keymap | Action |
|--------|--------|
| `<C-p>` | Accept suggestion |
| `<M-[>` `<M-]>` | Cycle through suggestions |
| `<C-l>` | Clear suggestion |

### Navigation

| Keymap | Action |
|--------|--------|
| `<leader><tab>` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fw` | Full-text search |
| `<leader>fh` | Recent files |
| `<leader>]` | Code structure (symbols) |
| `ud` | Undo history tree |

### Run / Debug

| Keymap | Action |
|--------|--------|
| `<leader>cr` | Run current code |
| `<leader>vs` | Create debug configuration |
| `<F7>` | Reset debugger |
| `<leader>di` | Hover variable evaluation |

### Miscellaneous

| Keymap | Action |
|--------|--------|
| `Y` (visual) | Copy to system clipboard |
| `ts` | Translate selection / word |
| `<leader>y` | Clipboard history |
| `U` | Update all plugins |

---

## ⚙️ Configuration — Neovim Core

### Global Options

| Option | Value | Description |
|--------|-------|-------------|
| `mouse` | (empty) | Disable mouse |
| `clipboard` | `unnamedplus` | System clipboard |
| `autochdir` | `true` | Auto-change cwd |
| `hidden` | `true` | Allow switching buffers with unsaved changes |
| `hlsearch` | `true` | Highlight search results |
| `smartcase` | `true` | Smart case matching in search |
| `scrolloff` | `5` | Keep 5 lines visible around cursor |
| `updatetime` | `100` | Update interval in ms |
| `foldmethod` / `foldlevelstart` | `indent` / `99` | Code folding |
| `completeopt` | `longest,menuone,noinsert,noselect,preview` | Completion behavior |

### Buffer / Window Options

| Option | Value | Description |
|--------|-------|-------------|
| `tabstop` / `shiftwidth` | `2` | Indentation width |
| `expandtab` | `true` | Convert tabs to spaces |
| `relativenumber` | `true` | Relative line numbers |
| `cursorline` | `true` | Highlight current line |
| `signcolumn` | `yes` | Always show sign column |
| `listchars` | `tab:¦ ,trail:▫` | Display invisible characters |

---

## ⚙️ Configuration — LSP (coc.nvim)

### Language Servers

| Language | Server | Notes |
|----------|--------|-------|
| C/C++/CUDA | **clangd** | Requires `compile_commands.json` |
| Go | **gopls** | Requires `go.mod` |
| Lua | **lua-language-server** | Ignores `vim` global |
| Python | **pyright** + **ruff** | Linting + formatting |
| Rust | **rust-analyzer** | Requires `Cargo.toml` |
| JavaScript/TypeScript | **coc-tsserver** | |
| Vue | **@yaegassy/coc-volar** | Vue 3 |
| Verilog/SystemVerilog | **svlangserver** | Formatted with verible |
| Bash | **bash-language-server** | |
| CMake | **cmake-language-server** | |
| Assembly | **asm-lsp** | `.asm` `.s` files |

### Auto-Installed Extensions

```
coc-css  coc-diagnostic  coc-html  coc-json  coc-prettier
coc-pyright  coc-snippets  coc-syntax  coc-tsserver  coc-vimlsp
@yaegassy/coc-volar  coc-xmake  coc-yank
```

### Diagnostic Configuration

| Filetype | Diagnostic Tool |
|----------|------------------|
| Python | ruff |
| Shell | shellcheck |
| Markdown | write-good, markdownlint |
| VimL | vint |

---

## ⚙️ Configuration — Formatting

All formatting is managed by `formatter.nvim`. Use `fm` to save and format.

| Filetype | Tool | Notes |
|----------|------|-------|
| C/C++ | `clang-format` | Language inferred from filename |
| Lua | `stylua` | Config: `static/stylua.toml` |
| Python | `black` | |
| JavaScript | `prettier` | Single quotes |
| Markdown | `prettier` | Single quotes |
| JSON | `js-beautify` | 2 spaces |
| Shell | `shfmt` | 2 spaces |
| Verilog/SV | `verible-verilog-format` | |

---

## 🔧 Featured Features

### AI Coding (Avante)

```bash
export AVANTE_DEEPSEEK_API_KEY=<your-api-key>
```

Model: `deepseek-v4-flash`. Interact via the AI chat dialog in Neovim.

### One-Click Run

Press `<leader>cr` to run code:

| Language | Command |
|----------|---------|
| C/C++/CUDA | Smart compilation (see below) |
| Go | `go run .` |
| Lua | `lua <filename>` |
| Python | `python3 <filename>` |

C/C++ build strategy is automatically selected based on project environment:

```
xmake.lua exists       → xmake && xmake run
CMakeLists.txt exists  → cmake -B build && cmake --build build
Default                → g++ -g -Wall <file> -o <out> && ./<out>
```

### Debugger (Vimspector)

Graphical debugging support for C/C++, Go, and Python.

1. `<leader>vs` — create a `.vimspector.json` from a template
2. `F5` start / `<F7>` reset
3. `<leader>di` — evaluate variable under cursor

### Markdown Preview

Real-time browser preview. Default port: 1459, supports LAN access.

```vim
:MarkdownPreview
:MarkdownPreviewStop
```

### Code Structure

Press `<leader>]` to open the symbol panel on the right (powered by ctags):

```
╰─▸ functions
├─▸ variables
```

---

## 🎨 Theme

[onedark.nvim](https://github.com/navarasu/onedark.nvim) · dark style

| Element | Style |
|---------|-------|
| Functions | **Bold** |
| Comments | *Italic* |
| coc selection | `#F19EE2` |

Status line: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) · dracula variant

---

## 📋 Notes

- **First Launch**: [lazy.nvim](https://github.com/folke/lazy.nvim) and Treesitter automatically install plugins and parsers
- **Backup / Undo**: Automatically saved to `tmp/backup` and `tmp/undo` — persistent undo history is supported
- **File Tree**: nvim-tree replaces netrw
- **PKGBUILD**: Automatically recognized as shell script
- **Providers**: Ruby/Perl providers are disabled; Python uses system `python3`

---

## 📦 All Plugins

### AI · Completion

| Plugin | Description |
|--------|-------------|
| [avante.nvim](https://github.com/yetone/avante.nvim) | DeepSeek AI assistant |
| [coc.nvim](https://github.com/neoclide/coc.nvim) | LSP + completion engine |
| [windsurf.vim](https://github.com/Exafunction/windsurf.vim) | Codeium AI completion |
| [vim-snippets](https://github.com/honza/vim-snippets) | Snippet library |

### UI

| Plugin | Description |
|--------|-------------|
| [onedark.nvim](https://github.com/navarasu/onedark.nvim) | Colorscheme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Tabline |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) | Startup dashboard |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |

### Editing

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto brackets |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround editing |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Code commenting |
| [rainbow-delimiters](https://github.com/hiphish/rainbow-delimiters.nvim) | Rainbow brackets |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) | One-click run |
| [colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) | Color highlighting |
| [formatter.nvim](https://github.com/mhartington/formatter.nvim) | Code formatting |
| [wildfire.vim](https://github.com/gcmt/wildfire.vim) | Quick selection |
| [tabular](https://github.com/godlygeek/tabular) | Text alignment |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | TODO highlighting |
| [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) | Table editing |

### Navigation

| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [fzf](https://github.com/junegunn/fzf) / [fzf.vim](https://github.com/junegunn/fzf.vim) | Fuzzy search |
| [vista.vim](https://github.com/liuchengxu/vista.vim) | Code structure viewer |
| [undotree](https://github.com/mbbill/undotree) | Undo history tree |

### Language · Tools

| Plugin | Description |
|--------|-------------|
| [vim-go](https://github.com/fatih/vim-go) | Go language support |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | MD preview |
| [vim-js](https://github.com/yuezk/vim-js) | JavaScript syntax |
| [vimspector](https://github.com/puremourning/vimspector) | Visual debugger |
| [suda.vim](https://github.com/lambdalisue/suda.vim) | sudo write support |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs |
| [vim-translator](https://github.com/voldikss/vim-translator) | Translation |

