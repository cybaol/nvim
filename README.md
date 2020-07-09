### Please Read README Before Usage !

### my Platform : Manjaro

## Dependence Installation

#### vista depends on 'universal-ctags'
```bash
sudo pacman -S universal-ctags
```

#### coc.nvim depends on 'nodejs'
```bash
sudo pacman -S nodejs npm
sudo npm install -g neovim
```
#### vimspector for 'cpp' & 'python'
```bash
sudo pacman -S gdb
pip install debugpy
```

## clangd Installation
```bash
sudo pacman -S llvm
```

## Start Installation
```vim
sudo pacman -S neovim

sudo vim /etc/hosts

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
git clone https://github.com/maximtrp/ranger-archives ~/.config/ranger/plugins/ranger-archives
make install
```
if you want to have a better experience, recommend to install [nerdfonts](https://www.nerdfonts.com)<br>
now you can use it !
