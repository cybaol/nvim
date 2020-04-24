### Please Read README.md Before Use !

### my platform : Deepin v20 beta (based on Debian)

there are some bugs still.  

## Dependence Installation

#### tagbar depends on 'ctags'  
```sh
sudo apt install ctags  
```  
#### coc.nvim depends on 'nodejs' & 'yarn'  
```sh
sudo apt install nodejs  
sudo apt install yarn  
```  
#### ccls installation  
```sh
sudo apt install ccls  
```  
if not success (mention : cannot locate package: ccls)  
please [click here](https://github.com/MaskRay/ccls/wiki) installing from ccls wiki  

#### modify _____machine_specific.vim
modify python path to your owner path  

## Start Installation
```vim

sudo apt install neovim  

git clone https://github.com/cybaol/nvim  
// attention : clone to path '~/.config/'  

cd nvim  

nvim init.vim  

:PlugInstall  

```

now you can use it!  

thanks for [theniceboy](https://github.com/theniceboy/nvim)  

