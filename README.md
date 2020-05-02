### Please Read README Before Usage !

### my platform : Deepin v20 Beta (based on Debian10)

there are some bugs still.

## Dependence Installation

#### tagbar depends on 'ctags'
```bash
sudo apt install ctags
```
#### coc.nvim depends on 'nodejs'
```bash
sudo apt install nodejs
npm install -g neovim
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

sudo nvim /etc/hosts

add '199.233.68.133 raw.githubusercontent.com' to hosts
add '151.101.108.223 pypi.python.org' to hosts

git clone --depth=1 https://github.com/cybaol/nvim.git ~/.config/

nvim

:PlugInstall

:checkhealth
```
## Other Useful Tools
```bash
sudo apt install fzf
sudo apt install silversearcher-ag

sudo apt install ranger
ranger --copy-config=all
```
now you can use it!
