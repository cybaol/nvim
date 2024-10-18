### Please Read README Before Usage !

### OS : [Arch Linux](https://www.archlinux.org)

### Plugmanager : [lazy.nvim](https://github.com/folke/lazy.nvim)

## Dependencies Installation

#### [coc.nvim](https://github.com/neoclide/coc.nvim) depends on 'nodejs'

```bash
sudo pacman -S nodejs npm &&
npm install neovim
```

#### [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) depends on 'lua-penlight'

```bash
sudo pacman -S lua-penlight
```

#### [vista.vim](https://github.com/liuchengxu/vista.vim) depends on 'universal-ctags'

```bash
sudo pacman -S ctags
```

## [bash-language-server](https://github.com/bash-lsp/bash-language-server) Installation

```bash
sudo pacman -S bash-language-server
```

## [clangd](https://clangd.llvm.org/installation.html) Installation

```bash
sudo pacman -S clang
```

## [cmake-language-server](https://github.com/regen100/cmake-language-server) Installation

```bash
yay -S cmake-language-server
```

## [lua-language-server](https://github.com/sumneko/lua-language-server) Installation

```bash
sudo pacman -S lua-language-server
```

## [svlangserver](https://github.com/imc-trading/svlangserver) Installation
```bash
yay -S svlangserver
```

## Start Installation

```bash
sudo pacman -S neovim

git clone https://github.com/cybaol/nvim.git ~/.config/nvim
```

Run command `:checkhealth` to check other dependencies

## Other Useful Tools

```bash
sudo pacman -S zsh ranger

git clone https://github.com/cybaol/zsh.git ~/.config/zsh &&
cp ~/.config/zsh/zshrc ~/.zshrc &&
git clone https://github.com/cybaol/ranger.git ~/.config/ranger &&
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons &&
git clone https://github.com/maximtrp/ranger-archives ~/.config/ranger/plugins/ranger-archives
```

if you want to have a better experience, recommend to install [nerdfonts](https://www.nerdfonts.com)<br>
now you can use it !
