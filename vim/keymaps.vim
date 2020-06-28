nnoremap <silent> <leader>nn :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <silent> <leader>nl :nohlsearch<CR>

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
" g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
" d: 查找本函数调用的函数
" c: 查找调用本函数的函数
" t: 查找指定的字符串
" e: 查找egrep模式，相当于egrep功能，但查找速度快多了
" f: 查找并打开文件，类似vim的find功能
" i: 查找包含本文件的文件
nmap <C-m>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-m>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-m>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" autoload cscope.out file
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

"----------------------------------------------------------------------
" map CTRL_HJKL to move cursor in all mode
" config terminal bind <backspace> to ASCII code 127
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" inoremap <C-e> <Esc>A
" inoremap <C-a> <Esc>I
" inoremap <C-w> <Esc>db

" window management
noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l
noremap <tab>w <c-w>w
noremap <tab>c <c-w>c
noremap <tab>+ <c-w>+
noremap <tab>- <c-w>-
noremap <tab>, <c-w>< 
noremap <tab>. <c-w>>
noremap <tab>= <c-w>=
noremap <tab>s <c-w>s
noremap <tab>v <c-w>v
noremap <tab>o <c-w>o

" insert mode as emacs
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>

nnoremap <c-a> <home>
nnoremap <c-e> <end>

" faster command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>

nnoremap <leader>u bguwe
nnoremap <leader>U bgUwe

" inoremap <C-h> <Nop>

" complete enter mapping

" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
