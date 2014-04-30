" program:

"       这个文档是用来设置vim的基本配置，主要是参考网上的，xineohpanihc.iteye.come/blog/114694这个blog的。。
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" thought: 这个配置文档写的时候有方式开始，
"第一个是直接根据自己需要的功能去设置，
"问题：

      
"   这个的前提是你要知道你自己需要什么功能，而且还要知道你需要的功能怎么去设定。

"第二个是根据现在有的设置文档，逐行逐行进行设置
"问题：

"   这个会发现有很多自己不知道的功能设定，要花费时间去学它，太浪费时间了，

"解决方式，其实我们要衡量的是时间消耗跟主要功能实现之间的问题，那么我们有一些基本准则要遵守，第一就是：学到能够用上就好了，不用学到非常非常精，自己到时候真的非常需要而且感兴趣的时候再认真研究。第二，简单，人性化。

"history
"  2012/10/08    darranchen   first release


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示行号

set nu

"不要使用vi 的键盘模式，而是vim自己的

set nocompatible

"history 文件中需要记录的行数

set history=100

"再处理未保存或者只读文件的时候，弹出确认

set confirm

"与 windows 共享剪贴板

set clipboard+=unnamed

"检测文件类型

filetype on

"载入文件类型插件,文件的插件有一个功能是让写注释的时候保留上一行的第一个符号。

filetype plugin on

"为特定文件类型载入相关缩进文件,看了说明，不知道什么东西。悲剧啊。

filetype indent on

"保持全局变量

set viminfo+=!

"带有如下符号的单词不要被换行分割，这是什么意思啊。。不理解，灯下试试，也就是我们如果出现这个字符的时候我们需要换行就自动的

set iskeyword+=$

" 语法高亮
syntax on

"高亮字符，让其不受100列限制 ：不明白啊。。算了

":highlight OverLength ctermbg=red ctermfg=white guibh=red guifg=white
":match OverLength '\%101v.*'

"状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight statusLineNC guifg=Gray guibg=White

"高亮光标所在的行（有没有必要，等下试试效果如何）
"set cursorline

"不要闪烁，不懂，所以就不用管他了，暂时不会用到的。。

"set novisualbell

"显示状态栏在倒数第二行，取消可以用set laststatus=0
set laststatus=2

"a 状态栏显示目前所执行的指令

set showcmd
"修改vimrc 后自动生效
autocmd! bufwritepost .vimrc source ~/.vimrc

"增强模式中的命令行自动完成操作
set wildmenu


"再状态行下显示光标所在位置和行号和列号

set ruler

"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"通过使用： commands命令，告诉我们文件的哪一行别修改过。不清楚啊
"set report=0

"不让vim发出讨厌的滴滴声

"set noerrorbells
"打开vim的状态栏标尺，显示当前光标所在位置再文件中的行号，列号，以及对应的整个文件的百分比。

set ru
"设置让向左向右的键能够到上一行和下一行。

set whichwrap+=h,l

"再被分割的窗口见显示空白，便于阅读

set fillchars=vert:\ ,stl:\ ,stlnc:\

"用空格见来开关折叠,设置能否折叠的功能。

set foldenable
set foldmethod=manual
nnoremap @=((foldclosed(line('.'))<0? 'zc':'zo')

"设定默认解码

set fenc=utf-8
set fencs=utf-8,usv-born,euc-jp,gb18030,gbk,gb2312,cp936

"设定字体

"set guifont-Courier_New:h11:cANSI
set guifontwide=新宋体:h11:cGB2312

"设定编码

set enc=utf-8
set fileencodings=usc-born,utf-8,chinese
"set langmenu=zh_CH.UTF-8
"language message zh_CH.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"搜索和匹配

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"高亮显示匹配的括号
set showmatch

"匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

"在搜索的时候忽略大小写

set ignorecase

"高亮被收缩的句子（phrases)
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"菜单栏和工具栏的设定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
	"关闭菜单栏
	"set guioptions-=m
	"关闭工具栏
	set guioptions-=T
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"不要备份文件
"set nobackup

"不要生成swap文件，当buffer 被丢弃的时候隐藏它
"
"setlocal noswapfile
"set bufhidden=hide

"字符间插入的像素行数目

set linespace=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"文本格式和排版
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动格式化
set formatoptions=tcrqn

"继承前一行的缩进方式，特别适合用于多行注释
set autoindent

"为C程序提供自动缩进
set smartindent

"使用C样式的缩进

set cindent

"colorscheme desert
"
"
"设置可以使用的taglist 边框。

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"使用winManager 插件

let g:winManagerWindowLayout='FileExplorer|Taglist'
nmap wm :WMToggle<cr>

"使用 cscope文档

set cscopequickfix=s-,c-,d-,i-,t-,e-

"设置tab 自动跳4个空格
set tabstop=4

set shiftwidth=4
set softtabstop=4

set expandtab
"使用R的插件

let g:vimrplugin_screenplugin=1
let g:vimrplugin_underscore=1
let g:vimrplugin_nosingler=1
let g:vimrplugin_noscreenrc=1

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex

" can be called correctly.

set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you

" search in a singe file. This will confuse Latex-Suite. Set your grep

" program to always generate a file-name.

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to

" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.

" The following changes the default filetype back to 'tex':

let g:tex_flavor='latex'


" Viki
let g:vikiNameSuffix=".viki"
augr viki
au!
autocmd! BufRead,BufNewFile *.viki set filetype=viki
augr END

" .m files are "octave" files
" augroup filetypedetect
"   au! BufRead,BufNewFile *.m, set filetype=octave
"   autocmd FileType octave map <buffer> <f5> ggOpkg load all<esc>Gopause<esc>:w<cr>:!octave -qf %<cr>ddggdd:w<cr>
"augroup END
imap <buffer> <F5> <Esc>:!tmux send-keys -t octave "<C-r>=getline('.')<CR>"<C-r>=nr2char(13)<CR><CR>a
nmap <buffer> <F5>      :!tmux send-keys -t octave "<C-r>=getline('.')<CR>"<C-r>=nr2char(13)<CR><CR>

let s:octave_selection = '/var/tmp/vim_octave_selection.m'

"vmap <buffer> <F5> call ExecSelection()<CR><CR>
imap <buffer> <F3> <Esc>:!tmux send-keys -t octave "<C-r>=expand('%:t:r')<CR>"<C-r>=nr2char(13)<CR><CR>a
nmap <buffer> <F3>      :!tmux send-keys -t octave "<C-r>=expand('%:t:r')<CR>"<C-r>=nr2char(13)<CR><CR>
