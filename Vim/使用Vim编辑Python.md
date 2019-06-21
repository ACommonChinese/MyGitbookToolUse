# 使用Vim编辑Python

[参见这里](https://linuxhint.com/vim-python-development/)
[参见这里](https://realpython.com/vim-and-python-a-match-made-in-heaven/#macos-os-x)

**配置VIM支持Python**

VIM默认会读取HOME目录（即`~/.`）下名叫`.vimrc`的配置文件:

`vim ~/.vimrc`
把下面代码粘入：

```Shell
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent
```

接下来安装`python-syntax`
安装这个module可以使用vim代码颜色提示更友好, python-syntax module must be kept on a specific directory:
`~/.vim/syntax`

```Shell
mkdir -p ~/.vim/syntax
cd ~/.vim/syntax
wget https://raw.githubusercontent.com/hdima/python-syntax/master/syntax/python.vim
```

```Shell
vim ~/.vimrc // add this line:
let python-highlight_all = 1
```

#### 安装 Vim
MacOS
```
$ brew update
$ brew install vim
```

#### 安装 Vundle
Vundle makes installing and updating packages trivial(不重要的，容易的).
Vundle是Vim的package manager包管理器。
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

#### 编辑vimrc文件
```
touch ~/.vimrc

vim ~/.vimrc, 并添加下面code在vimrc顶部:

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

call vundle#end()            
filetype plugin indent on
```

使用Vundle安装插件：
```
首先编辑vimrc, 比如添加：Plugin 'tmhedberg/SimpylFold'
然后：
:PluginInstall
```

**使用Vim配置Python编译**
[参见这里](https://stackoverflow.com/questions/18948491/running-python-code-in-vim)
首先，调用`vim --version`, 如果出现`+python3`则：

1. 在~/.vimrc中添加`let g:pymode_python = 'python3'`
2. 调用`:w !python`运行python

不过一般我们会在vimrc中添加map，使用快捷键直接运行，参见[Leader](./Leader.md)

