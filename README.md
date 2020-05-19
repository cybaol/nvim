### Please Read README Before Usage !

### my platform : Deepin v20 Beta (based on Debian10)

## Dependence Installation

#### vista depends on 'universal-ctags'
```bash
sudo apt-get install libjansson-dev

git clone --depth=1 https://github.com/universal-ctags/ctags.git
cd ctags
```
and then [click here](https://github.com/universal-ctags/ctags/blob/master/docs/autotools.rst) installing from official docs

#### coc.nvim depends on 'nodejs'
```bash
sudo apt install nodejs npm
sudo npm install -g neovim
```
#### vimspector for 'cpp' & 'python'
```bash
sudo apt install gdb
pip3 install debugpy
```

## ccls Installation
```bash
sudo apt install ccls
```
if not success (mention : Unable to locate package ccls)  
please [click here](https://github.com/MaskRay/ccls/wiki) installing from ccls wiki

## Start Installation
```vim
sudo apt install neovim

sudo vim /etc/hosts

add '199.233.68.133 raw.githubusercontent.com' to hosts
add '151.101.108.223 pypi.python.org' to hosts

git clone https://github.com/cybaol/nvim.git ~/.config/nvim

vim

:checkhealth
```
## Other Useful Tools
```bash
sudo apt install fzf
sudo apt install silversearcher-ag

sudo apt install ranger
git clone https://github.com/cybaol/ranger.git ~/.config/ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
git clone https://github.com/maximtrp/ranger-archives ~/.config/ranger/plugins/ranger-archives
make install
```
if you want to have a better experience, recommend to install [nerdfonts](www.nerdfonts.com)
now you can use it !
