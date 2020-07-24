
" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
set signcolumn=auto

" 总是显示标签栏
" set showtabline=2

" 水平切割窗口时，默认在右边显示新窗口
set splitright

colorscheme solarized
set background=dark
let g:solarized_termtrans=1
" 允许 256 色
set t_Co=256

" 解决gbk时消息乱码问题
if has("gui_running")
    set mouse=a
    set langmenu=zh_cn.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_cn.utf-8
    set gfn=Monaco:h12

    " no scroll bar
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" vim600: sw=4 ts=4 fdm=marker syn=vim
