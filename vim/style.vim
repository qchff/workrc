
colorscheme solarized
set background=dark
let g:solarized_termtrans=1

" 解决gbk时消息乱码问题
if has("gui_running")
    set mouse=a
    set langmenu=zh_cn.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_cn.utf-8
    set gfn=Monaco:h12
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" vim600: sw=4 ts=4 fdm=marker syn=vim
