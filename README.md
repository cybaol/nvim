### Please Read README Before Usage !

### my Platform : [Arch Linux](https://www.archlinux.org)

### my Plugmanager : [dein.vim](https://github.com/Shougo/dein.vim)

## Dependence Installation

#### [coc.nvim](https://github.com/neoclide/coc.nvim) depends on 'nodejs'

```bash
sudo pacman -S nodejs npm &&
sudo npm install -g neovim
```

#### [fzf.vim](https://github.com/junegunn/fzf.vim) depends on 'ag' & 'bat' & 'fd' & 'fzf' & 'perl' & 'rg'

```bash
sudo pacman -S bat fd fzf perl ripgrep the_silver_searcher
```

#### [vimspector](https://github.com/puremourning/vimspector) for 'cpp' & 'python' & 'go'

```bash
sudo pacman -S gdb &&
pip install debugpy
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
sudo npm i -g bash-language-server
```

## [clangd](https://clangd.llvm.org/installation.html) Installation

```bash
sudo pacman -S clang
```

## [digestif](https://github.com/astoff/digestif) Installation

```bash
sudo luarocks --lua-version=5.3 install digestif
```

## [lua-lsp](https://github.com/Alloyed/lua-lsp) Installation

```bash
sudo luarocks --lua-version=5.3 install lua-lsp &&
sudo luarocks install luacheck &&
sudo luarocks --lua-version=5.3 install lcf &&
sudo luarocks install lua-cjson
```

## Start Installation

```vim
sudo pacman -S yay &&
yay -S neovim-nightly-bin

sudo nvim /etc/hosts

add '151.101.108.133 raw.githubusercontent.com' to hosts
add '151.101.108.223 pypi.python.org' to hosts

git clone https://github.com/cybaol/nvim.git ~/.config/nvim

nvim

:checkhealth
```

## Other Useful Tools

```bash
sudo pacman -S zsh ranger

git clone https://github.com/cybaol/zsh.git ~/.config/zsh &&
cp ~/.config/zsh/zshrc ~/.zshrc &&
git clone https://github.com/cybaol/ranger.git ~/.config/ranger &&
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons &&
git clone https://github.com/maximtrp/ranger-archives ~/.config/ranger/plugins/ranger-archives &&
cd ~/.config/ranger/plugins/ranger-archives && make install
```

if you want to have a better experience, recommend to install [nerdfonts](https://www.nerdfonts.com)<br>
now you can use it !
