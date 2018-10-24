call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
"Plugin 'Molokai'









call plug#end()

let g:auto_save = 1

"----------------------------"
"--------- seoul256 ---------"
"----------------------------"
" Unified color scheme (default: dark)
colo seoul256

""Light color scheme
""colo seoul256-light
"
" Switch
" set background=dark
"set background=light
 
" seoul256 (dark):
" Range:   233 (darkest) ~ 239 (lightest)
" Default: 237
let g:seoul256_background = 200
""colo seoul256
 
" " seoul256 (light):
" Range:   252 (darkest) ~ 256 (lightest)
" Default: 253
" let g:seoul256_background = 236
" colo seoul256




""=====================================================



set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"
let g:airline_theme="molokai" 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1
set guifont=Consolas\ for\ Powerline\ FixedD:h11
"old symbols
if !exists('g:airline_symbols')
       let g:airline_symbols = {}
endif
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'


"------------ ctrlp-------------------------------------"

let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'
 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>



"------------ YouCompleteMe--------------------------------------"
" Python Semantic Completion
let g:ycm_python_binary_path = '/usr/bin/python3'
" C family Completion Path
let g:ycm_global_ycm_extra_conf='/home/hessen/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 跳转快捷键
nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <c-h> :YcmCompleter GoToDefinition<CR>| 
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
set completeopt=longest,menu
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" 主动补全, 默认为<C-Space>可能会冲突
let g:ycm_key_invoke_completion = '<F2>'
" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
"let g:ycm_key_list_stop_completion = ['<C-y>']






"----------------------------"
"--------Global Config-------"
"----------------------------"
"
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
 
function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf
 
function CloseBracket()
if match(getline(line('.') + 1), '\s*}') < 0
return "\<CR>}"
else
return "\<Esc>j0f}a"
endif
endf
 
function QuoteDelim(char)
let line = getline('.')
let col = col('.')
if line[col - 2] == "\\"
return a:char
elseif line[col - 1] == a:char
return "\<Right>"
else
return a:char.a:char."\<Esc>i"
endif
endf
 
 
"==================================
syntax on
set nu
set noswapfile
set nobackup
"set mouse=a
 
filetype on
 
set history=1000
set cursorline
"set cursorcolumn
 
set autoindent
set cindent
set smartindent
 
"set expandtab " space grid replace tab
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set linespace=50
let autosave=5
 
set linebreak
set showmatch
 
set fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set fileformats=unix
set encoding=prc
set encoding=utf-8
 
set hlsearch
set incsearch
 
set laststatus=2
"set ruler
 
"no \n
set nowrap
 
 
autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.cc, exec ":call Addreadme()"
 
function Addreadme()
	call setline(1, " ///")
     call append(1, " /// @file    " .expand("%:t"))
     call append(2, " /// @author  hessen(dhxsy1994@gmail.com)")
     call append(3, " /// @date    ".strftime("%Y-%m-%d %H:%M:%S"))
     call append(4, " ///")
     call append(5, " ")
endf
 
 
"set maplearder
let  mapleader = ","
map <silent> <leader>ee :!vim ~/.vimrc<cr>
