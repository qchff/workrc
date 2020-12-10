" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
filetype off
if has("unix")
    call plug#begin()
else
    call plug#begin('$VIM/vimfiles/bundle/')  
endif

" Plugin 'kien/ctrlp.vim'
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

Plug 'tomtom/tcomment_vim'
nnoremap <leader>// :TComment<CR>
vnoremap <leader>// :TComment<CR>

Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-D> :call PhpDocSingle()<CR> 
vnoremap <C-D> :call PhpDocRange()<CR>

" Plugin "Mark--Karkat"
" <leader>m, <leader>n

Plug 'Lokaltog/vim-easymotion'
" let g:EasyMotion_leader_key = 'f'

Plug 'vim-airline/vim-airline'

" 多光标操作
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-surround'
" cs"',ds',yss(,ysiw]

"" supertab 和 youcompleteme 二者选其一 Default supertab
" Plug 'ervandew/supertab'
"
"" can't use brew python, macvim signal ABRT
Plug 'Valloric/YouCompleteMe'
" YCM 补全菜单配色
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
" 从第二个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

" syntax check
" Plugin 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

Plug 'Raimondi/delimitMate'
let delimitMate_matchpairs = "(:),[:],{:}"
let b:delimitMate_balance_matchpairs = 1

Plug 'godlygeek/tabular'
" :Tabularize /=
" :Tabularize /=\zs

" must after tabublar plugin
" Plug 'plasticboy/vim-markdown'
" Plugin 'suan/vim-instant-markdown'

" Plugin 'shawncplus/phpcomplete.vim'

Plug 'vim-scripts/The-NERD-tree'
noremap <leader>d :NERDTreeToggle<CR>

Plug 'majutsushi/tagbar'
nnoremap <leader>] :TagbarToggle<CR>
let g:tagbar_type_php  = {
\ 'ctagstype' : 'php',
\ 'kinds'     : [
    \ 'i:interfaces',
    \ 'c:classes',
    \ 'd:constant definitions',
    \ 'f:functions',
    \ 'j:javascript functions:1'
\ ]
\ }

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

Plug 'altercation/vim-colors-solarized'

" Plug 'ludovicchabant/vim-gutentags'
" " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" Plug 'tpope/vim-commentary'

" Plug 'kana/vim-textobj-entire'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

Plug 'mhinz/vim-startify'

set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'myusuf3/numbers.vim'

" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
filetype plugin indent on     " required!
