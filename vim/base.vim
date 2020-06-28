" @date 2014-09-29
let mapleader=','

" don't bother with vi compatibility
set nocompatible

" seneral settings
syntax enable          " enable syntax highlighting
" set mouse-=a           " disable mouse
set nobomb             " utf8 bomb
set showcmd
set number             " show line numbers
set ruler              " show where you are
set modeline           " 启用Modeline,详见http://vim.wikia.com/wiki/Modeline_magic
set scrolloff=5        " 光标移动到buffer的顶部和底部时保持n行距离

" set textwidth=100      " Linebreak
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%101v.\+/

set nowrap             " no wrap
" set backspace=2        " 设置回格键正常处理
set backspace=indent,eol,start
set clipboard+=unnamed " Yanks go on clipboard instead.
set directory-=.       " don't store swapfiles in the current directory
set wildmenu           " show a navigable menu for tab completion
set wildmode=longest,list
set autochdir          " 自动修改vim当前目录为文件所在目录
set tags=./.tags;.tags         " tags文件搜索

" cscope
set csto=1
set cst

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" search
set smartcase
set hlsearch
set noincsearch

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" indent
set smartindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

" fold
set foldenable
set foldmethod=marker

" no scroll bar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" no scratch preview
" set completeopt=longest,menu
set completeopt-=preview

" iterm2 vim performance
set lazyredraw
set ttyfast
" set synmaxcol=128
syntax sync minlines=256

" set lines=999
" set columns=9999

" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" auto reload vimrc where editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
