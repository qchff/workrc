"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 修改leader键为,
let mapleader=','

" 禁用 vi 兼容模式
set nocompatible

" 自动缩进
set autoindent

" 打开 C/C++ 语言缩进优化
set cindent

" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" 关闭自动换行
set nowrap

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" 显示光标位置
set ruler

" 设置 Backspace 键模式
set backspace=indent,eol,start

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;.tags

"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif

"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
	filetype plugin indent on
endif

set nobomb             " utf8 bomb
set showcmd
set number             " show line numbers
set modeline           " 启用Modeline,详见http://vim.wikia.com/wiki/Modeline_magic
set scrolloff=5        " 光标移动到buffer的顶部和底部时保持n行距离

"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断,默认忽略大小写,除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时不动态增量显示查找结果
set noincsearch

" 设置tab为4空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 命令行补全，第一次Tab显示全部命令，第二次Tab循环补全
set wildmode=longest:list,full
set completeopt-=preview

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac


"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif


" 延迟绘制（提升性能）
set lazyredraw
set ttyfast
syntax sync minlines=256

" 记录同一个文件上次编辑位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" 自动加载.vimrc文件变化
autocmd! bufwritepost .vimrc source ~/.vimrc

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

" ---------------
" 过期配置
" ---------------

" " set textwidth=100      " Linebreak
" " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" " match OverLength /\%101v.\+/
"
" set clipboard+=unnamed " Yanks go on clipboard instead.
" set directory-=.       " don't store swapfiles in the current directory
" set autochdir          " 自动修改vim当前目录为文件所在目录
"
"
" " " cscope
" " set csto=1
" " set cst
