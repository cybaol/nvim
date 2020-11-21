### Please Read README Before Usage !

### my Platform : [Arch Linux](https://www.archlinux.org)

### my Plugmanager : [dein.vim](https://github.com/Shougo/dein.vim)

## Dependence Installation

#### [coc.nvim](https://github.com/neoclide/coc.nvim) depends on 'nodejs'
```bash
sudo pacman -S nodejs npm &&
sudo npm install -g neovim
```

#### [markdownpreview.nvim](https://github.com/iamcco/markdown-preview.nvim) depends on 'yarn'
```bash
sudo pacman -S yarn
```

#### [vim-clap](https://github.com/liuchengxu/vim-clap) depends on 'cargo' & 'ripgrep'
```bash
sudo pacman -S cargo ripgrep
```

#### [vimspector](https://github.com/puremourning/vimspector) for 'cpp' & 'python' & 'go'
```bash
sudo pacman -S gdb &&
sudo pip install debugpy
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
sudo pacman -S neovim

sudo nvim /etc/hosts

add '151.101.108.133 raw.githubusercontent.com' to hosts
add '151.101.108.223 pypi.python.org' to hosts

git clone https://github.com/cybaol/nvim.git ~/.config/nvim

nvim

:checkhealth
```

## Other Useful Tools
```bash
sudo pacman -S fzf zsh ranger

git clone https://github.com/cybaol/zsh.git ~/.config/zsh &&
cp ~/.config/zsh/zshrc ~/.zshrc &&
git clone https://github.com/cybaol/ranger.git ~/.config/ranger &&
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons &&
git clone https://github.com/maximtrp/ranger-archives ~/.config/ranger/plugins/ranger-archives &&
cd ~/.config/ranger/plugins/ranger-archives && make install
```

my other repository:<br>
[dwm](https://github.com/cybaol/dwm)<br>
[zsh](https://github.com/cybaol/zsh)<br>
[ranger](https://github.com/cybaol/ranger)

if you want to have a better experience, recommend to install [nerdfonts](https://www.nerdfonts.com)<br>
now you can use it !
