### Please Read README Before Usage !

### OS : [Arch Linux](https://www.archlinux.org)

### Plugmanager : [packer.nvim](https://github.com/wbthomason/packer.nvim)

## Dependence Installation

#### [coc.nvim](https://github.com/neoclide/coc.nvim) depends on 'nodejs'

```bash
sudo pacman -S nodejs npm &&
npm install neovim
```

#### [vimtex](https://github.com/lervag/vimtex) depends on 'Tex Live' & 'zathura'

```bash
sudo pacman -S texlive-most texlive-lang zathura-pdf-poppler
```

#### [vista.vim](https://github.com/liuchengxu/vista.vim) depends on 'universal-ctags'

```bash
sudo pacman -S universal-ctags
```

## [bash-language-server](https://github.com/bash-lsp/bash-language-server) Installation

```bash
sudo pacman -S bash-language-server
```

## [clangd](https://clangd.llvm.org/installation.html) Installation

```bash
sudo pacman -S clang llvm-libs
```

## [cmake-language-server](https://github.com/regen100/cmake-language-server) Installation

```bash
yay -S cmake-language-server
```

## [lua-language-server](https://github.com/sumneko/lua-language-server) Installation

```bash
sudo pacman -S lua-language-server
```

## Start Installation

```bash
sudo pacman -S neovim

git clone https://github.com/cybaol/nvim.git ~/.config/nvim
```

Run command `:checkhealth` to check other dependences

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
