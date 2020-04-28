### Please Read README Before Usage !

### my platform : Deepin v20 Beta (based on Debian10)

there are some bugs still.  

## Dependence Installation

#### tagbar depends on 'ctags'  
```sh
sudo apt install ctags  
```  
#### coc.nvim depends on 'nodejs'  
```sh
sudo apt install nodejs  
npm install -g neovim
```  
emmmmmm, you may have some maddening problems, hhh.
#### vimspector depends on 'debugpy'
```sh
pip3 install pynvim  
pip3 install debugpy  
```  
## ccls Installation  
```sh
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

git clone https://github.com/cybaol/nvim.git  
// attention : clone to path '~/.config/'  

cd nvim  

modify machine_specific.vim python-path(yourself)  

nvim init.vim  

:PlugInstall  
```  
## Other Useful Tools
```sh
sudo apt install fzf  
sudo apt install silversearcher-ag  

sudo apt install ranger  
ranger --copy-config=all  

use :checkhealth to fix some warnnings and errors  
```  
now you can use it!  

thanks for [theniceboy](https://github.com/theniceboy/nvim)  

