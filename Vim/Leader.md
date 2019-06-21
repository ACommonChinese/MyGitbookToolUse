# Leader

参考：
- [https://vimjc.com/vim-leader.html](https://vimjc.com/vim-leader.html)

我们可以通过命令查看leader帮助文档：`:help leader`

```
To define a mapping which uses the "mapleader" variable, the special string
"<Leader>" can be used.  It is replaced with the string value of "mapleader".
If "mapleader" is not set or empty, a backslash is used instead.  Example:
        :map <Leader>A  oanother line<Esc>
Works like:
        :map \A  oanother line<Esc>
But after:
        :let mapleader = ","
It works like:
        :map ,A  oanother line<Esc>

Note that the value of "mapleader" is used at the moment the mapping is
defined.  Changing "mapleader" after that has no effect for already defined
mappings.
```

Vim自带很多快捷键，再加上各类插件的快捷键，大量快捷键出现在单层空间中难免引起冲突，为缓解该问题，引入了前缀键. Vim中的前缀键 `<Leader>` 类似于C++中的命名空间,可以理解为是某个Vim命令开始执行(前缀)的标识.
默认Vim的`<Leader>`是`\`

试验: 在非编辑模式下，通过输入`,A`, 达到：
1. 另起一行，进入插入模式
2. 插入字符串`This is a new line`
3. 回到命令模式

操作如下：

```Shell
:let mapleader = "," #把变量mapleader设置为字符,
:map ,A oThis is a new line <Esc> #当键入,A时，映射为键入：`oThis is a new line <Esc键>`
```

不过这种设置只是针对当前窗口，如果要全局有效，需在`~/.vimrc`文件中增加代码：

```
let mapleader = ","
map ,A oThis is a new line <Esc>
```

再比如，我们通过键入`,r`来运行当前python文件：

```
map ,r :! clear; python3 %
```




