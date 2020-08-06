### Please Read README Before Usage !

### my Platform : Arch Linux

### my Plugmanager : [dein.vim](https://github.com/Shougo/dein.vim)

## Dependence Installation

#### [vista.vim](https://github.com/liuchengxu/vista.vim) depends on 'universal-ctags'
```bash
sudo pacman -S universal-ctags
```

#### [coc.nvim](https://github.com/neoclide/coc.nvim) depends on 'nodejs'
```bash
sudo pacman -S nodejs npm
sudo npm install -g neovim
```
#### [vimspector](https://github.com/puremourning/vimspector) for 'cpp' & 'python'
```bash
sudo pacman -S gdb
pip install debugpy
```

#### [markdownpreview.nvim](https://github.com/iamcco/markdown-preview.nvim) depends on 'yarn'
```bash
sudo pacman -S yarn
```

## [ccls](https://github.com/MaskRay/ccls) Installation
```bash
sudo pacman -S ccls
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
sudo pacman -S fzf the_silver_searcher
sudo pacman -S ranger

git clone https://github.com/cybaol/ranger.git ~/.config/ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
git clone https://github.com/maximtrp/ranger-archives ~/.config/ranger/plugins/ranger-archives
make install
```
if you want to have a better experience, recommend to install [nerdfonts](https://www.nerdfonts.com)<br>
now you can use it !
