# Neovim 开发环境配置

[![lazy.nvim](https://img.shields.io/badge/Plugin%20Manager-lazy.nvim-blue)](https://github.com/folke/lazy.nvim)
[![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-green)](https://neovim.io)

> 基于 [lazy.nvim](https://github.com/folke/lazy.nvim) 的 Neovim 配置。

[**English Docs**](README.md)

---

## 项目结构

```
~/.config/nvim/
├── init.lua                  # 入口
├── lua/
│   ├── plugins.lua           # 插件声明
│   ├── plugin-configs.lua    # 插件配置入口
│   ├── core/
│   │   ├── options.lua       # 核心选项
│   │   └── mappings.lua      # 全局快捷键
│   └── modules/
│       ├── coc-configs.lua   # coc.nvim 配置
│       ├── compile.lua       # C/C++/CUDA 编译脚本
│       └── format.lua        # 格式化配置
├── coc-settings.json         # LSP 配置
├── vimspector-json/          # 调试模板
└── static/stylua.toml        # StyLua 配置
```

---

## 快速开始

```bash
sudo pacman -S neovim nodejs lua-penlight ctags clang yarn shfmt python-black prettier stylua
yay -S nodejs-neovim cmake-language-server svlangserver js-beautify
git clone https://github.com/cybaol/nvim.git ~/.config/nvim
nvim
```

---

## 🔑 快捷键速查

通用操作和按场景分类的快捷键。

### 窗口 / 缓冲 / 终端

| 快捷键 | 功能 |
|--------|------|
| `H` `J` `K` `L` | 窗口左 下 上 右 |
| `tt` | 垂直分屏终端 |
| `<C-n>` (终端) | 返回普通模式 |
| `bp` / `bn` | 上一个 / 下一个缓冲 |
| `<C-x>` | 关闭当前缓冲 |

### 代码编辑

| 快捷键 | 功能 |
|--------|------|
| `fm` | 保存并格式化 |
| `<leader>r` | 全局搜索替换 (`:%s///g`) |
| `<leader><cr>` | 取消搜索高亮 |
| `<leader>tm` | 切换表格模式 |
| `i` / `k` / `j` / `l` | PageUp / PageDown / 左移 / 右移 |

### 补全与 LSP (coc.nvim)

| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转定义 |
| `gi` | 跳转实现 |
| `gr` | 查找引用 |
| `rn` | 重命名 |
| `?` | 查看文档 |
| `<Tab>` `<S-Tab>` | 补全菜单上下 |
| `<leader>-` `<leader>=` | 上/下一个诊断 |
| `<C-j>` `<C-k>` | 浮动窗口滚动 |

### AI 补全 (Windsurf)

| 快捷键 | 功能 |
|--------|------|
| `<C-p>` | 接受建议 |
| `<M-[>` `<M-]>` | 切换建议 |
| `<C-l>` | 清除建议 |

### 导航

| 快捷键 | 功能 |
|--------|------|
| `<leader><tab>` | 文件树开关 |
| `<leader>ff` | 查找文件 |
| `<leader>fw` | 全文搜索 |
| `<leader>fh` | 最近文件 |
| `<leader>]` | 代码结构 |
| `ud` | 撤销历史 |

### 运行 / 调试

| 快捷键 | 功能 |
|--------|------|
| `<leader>cr` | 运行当前代码 |
| `<leader>vs` | 创建调试配置 |
| `<F7>` | 重置调试器 |
| `<leader>di` | 悬浮变量求值 |

### 其他

| 快捷键 | 功能 |
|--------|------|
| `Y` (可视) | 复制到系统剪贴板 |
| `ts` | 翻译选中/单词 |
| `<leader>y` | 剪贴板历史 |
| `U` | 更新全部插件 |

---

## ⚙️ 配置 — Neovim 基础

### 全局选项

| 选项 | 值 | 说明 |
|------|-----|------|
| `mouse` | 空 | 禁用鼠标 |
| `clipboard` | `unnamedplus` | 系统剪贴板 |
| `autochdir` | `true` | 自动切 cwd |
| `hidden` | `true` | 未保存可切换缓冲 |
| `hlsearch` | `true` | 搜索高亮 |
| `smartcase` | `true` | 智能大小写 |
| `scrolloff` | `5` | 滚动留 5 行 |
| `updatetime` | `100` | 更新间隔 ms |
| `foldmethod` / `foldlevelstart` | `indent` / `99` | 折叠 |
| `completeopt` | `longest,menuone,noinsert,noselect,preview` | 补全 |

### 缓冲 / 窗口选项

| 选项 | 值 | 说明 |
|------|-----|------|
| `tabstop` / `shiftwidth` | `2` | 缩进 |
| `expandtab` | `true` | tab 转空格 |
| `relativenumber` | `true` | 相对行号 |
| `cursorline` | `true` | 高亮当前行 |
| `signcolumn` | `yes` | 符号列常显 |
| `listchars` | `tab:¦ ,trail:▫` | 不可见字符 |

---

## ⚙️ 配置 — LSP (coc.nvim)

### 语言服务器

| 语言 | 服务器 | 说明 |
|------|--------|------|
| C/C++/CUDA | **clangd** | `compile_commands.json` |
| Go | **gopls** | `go.mod` |
| Lua | **lua-language-server** | 忽略 `vim` 全局 |
| Python | **pyright** + **ruff** | lint + 格式化 |
| Rust | **rust-analyzer** | `Cargo.toml` |
| JavaScript/TS | **coc-tsserver** | |
| Vue | **@yaegassy/coc-volar** | Vue 3 |
| Verilog/SV | **svlangserver** | verible 格式化 |
| Bash | **bash-language-server** | |
| CMake | **cmake-language-server** | |
| Assembly | **asm-lsp** | `.asm` `.s` |

### 自动安装的扩展

```
coc-css  coc-diagnostic  coc-html  coc-json  coc-prettier
coc-pyright  coc-snippets  coc-syntax  coc-tsserver  coc-vimlsp
@yaegassy/coc-volar  coc-xmake  coc-yank
```

### 诊断配置

| 文件类型 | 诊断工具 |
|----------|----------|
| Python | ruff |
| Shell | shellcheck |
| Markdown | write-good, markdownlint |
| VimL | vint |

---

## ⚙️ 配置 — 格式化

统一由 `formatter.nvim` 管理，快捷键 `fm` 保存并格式化。

| 文件类型 | 工具 | 备注 |
|----------|------|------|
| C/C++ | `clang-format` | 按文件名推断语言 |
| Lua | `stylua` | `static/stylua.toml` |
| Python | `black` | |
| JavaScript | `prettier` | 单引号风格 |
| Markdown | `prettier` | 单引号风格 |
| JSON | `js-beautify` | 2 空格 |
| Shell | `shfmt` | 2 空格 |
| Verilog/SV | `verible-verilog-format` | |

---

## 🔧 特色功能

### AI 编程 (Avante)

```bash
export AVANTE_DEEPSEEK_API_KEY=<your-api-key>
```

模型：`deepseek-v4-flash`，在 neovim 中通过对话框交互。

### 一键运行

`<leader>cr` 运行代码：

| 语言 | 命令 |
|------|------|
| C/C++/CUDA | 智能编译 (见下) |
| Go | `go run .` |
| Lua | `lua <filename>` |
| Python | `python3 <filename>` |

C/C++ 按项目环境自动选择：

```
xmake.lua 存在     → xmake && xmake run
CMakeLists.txt 存在 → cmake -B build && cmake --build build
默认               → g++ -g -Wall <file> -o <out> && ./<out>
```

### 调试器 (Vimspector)

支持 C/C++、Go、Python 图形化调试。

1. `<leader>vs` 新建 `.vimspector.json`，选择模板
2. `F5` 启动 / `<F7>` 重置
3. `<leader>di` 变量求值

### Markdown 预览

实时浏览器预览，默认端口 1459，支持局域网。

```vim
:MarkdownPreview
:MarkdownPreviewStop
```

### 代码结构

`<leader>]` 打开右侧符号面板 (ctags)：

```
╰─▸ functions
├─▸ variables
```

---

## 🎨 主题

[onedark.nvim](https://github.com/navarasu/onedark.nvim) · dark 风格

| 元素 | 样式 |
|------|------|
| 函数 | **加粗** |
| 注释 | *斜体* |
| coc 选中项 | `#F19EE2` |

状态栏：[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) · dracula

---

## 📋 注意事项

- **首次启动**：lazy.nvim 和 Treesitter 自动安装插件与解析器
- **备份 / 撤销**：自动写入 `tmp/backup` 和 `tmp/undo`，支持持久化撤销
- **文件树**：nvim-tree 替代 netrw
- **PKGBUILD**：自动识别为 shell
- **Provider**：禁用 Ruby / Perl，Python 用系统 `python3`

---

## 📦 全部插件

### AI · 补全

| 插件 | 说明 |
|------|------|
| [avante.nvim](https://github.com/yetone/avante.nvim) | DeepSeek AI 助手 |
| [coc.nvim](https://github.com/neoclide/coc.nvim) | LSP + 补全引擎 |
| [windsurf.vim](https://github.com/Exafunction/windsurf.vim) | Codeium AI 补全 |
| [vim-snippets](https://github.com/honza/vim-snippets) | 代码片段库 |

### 界面

| 插件 | 说明 |
|------|------|
| [onedark.nvim](https://github.com/navarasu/onedark.nvim) | 主题 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 状态栏 |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 标签栏 |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) | 启动页 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 文件树 |

### 编辑

| 插件 | 说明 |
|------|------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法高亮 |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 自动括号 |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | 环绕编辑 |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | 注释 |
| [rainbow-delimiters](https://github.com/hiphish/rainbow-delimiters.nvim) | 彩虹括号 |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | 缩进线 |
| [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) | 一键运行 |
| [colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) | 颜色高亮 |
| [formatter.nvim](https://github.com/mhartington/formatter.nvim) | 格式化 |
| [wildfire.vim](https://github.com/gcmt/wildfire.vim) | 快速选中 |
| [tabular](https://github.com/godlygeek/tabular) | 对齐 |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | TODO 高亮 |
| [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) | 表格 |

### 导航

| 插件 | 说明 |
|------|------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 模糊查找 |
| [fzf](https://github.com/junegunn/fzf) / [fzf.vim](https://github.com/junegunn/fzf.vim) | 模糊搜索 |
| [vista.vim](https://github.com/liuchengxu/vista.vim) | 代码结构 |
| [undotree](https://github.com/mbbill/undotree) | 撤销树 |

### 语言 · 工具

| 插件 | 说明 |
|------|------|
| [vim-go](https://github.com/fatih/vim-go) | Go 支持 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | MD 预览 |
| [vim-js](https://github.com/yuezk/vim-js) | JS 语法 |
| [vimspector](https://github.com/puremourning/vimspector) | 调试器 |
| [suda.vim](https://github.com/lambdalisue/suda.vim) | sudo 写文件 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 标记 |
| [vim-translator](https://github.com/voldikss/vim-translator) | 翻译 |
