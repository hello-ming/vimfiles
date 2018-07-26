set nocompatible
set modeline

"界面改为英文---------------------------------------
let $LANG = 'en'  "set message language
set langmenu=en_US   "set menu's language of gvim. no spaces beside '='
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set relativenumber
set ignorecase
set smartcase

set list
"set listchars=eol:⏎,tab:>-
"set listchars=tab:>-
set listchars=tab:▸\ 
hi NonText ctermfg=16 guifg=#4a4a59
hi SpecialKey ctermfg=16 guifg=#4a4a59

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
inoremap jj <ESC>

function NumberToggle()
    set relativenumber!
    set number!
endfunction
nmap <silent> <F6> :call NumberToggle()<CR>
nmap <silent> <F7> :set paste!<CR>

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

if  has("win32")
    set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set noswapfile
set incsearch
set hlsearch
set nowb
set backspace=start,indent,eol
set nu!
set autoindent
set smartindent
set nowrap
set textwidth=0
set tw=0
set guioptions+=b
set ruler
set showcmd

set noerrorbells
set novisualbell
set autochdir

syntax on
filetype plugin indent on

autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2
"colo desert
"colo desertEx
"colo wombat

let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast edit vimrc
if ! has("win32")
    nmap <silent> <leader>so :source ~/.vimrc<cr>
    nmap <silent> <leader>ee :edit ~/.vimrc<cr>
    "When .vimrc is edited, reload it
    "autocmd! bufwritepost .vimrc source ~/.vimrc
else
    nmap <silent> <leader>so :source $VIM/_vimrc<cr>
    nmap <silent> <leader>ee :edit $VIM/_vimrc<cr>
endif

:nnoremap <Leader>ss #*cgn
:nnoremap <Leader>sa :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

"快速注释
map <F2> ,c<space>
"map <C-n> :nohl<cr>
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
nmap zfab zfaB



"启动时最大化
" Maximum window when GUI running
if has("gui_running")
    "autocmd GUIEnter * simalt ~x
  set lines=45 columns=160
endif

"允许不保存buffer而切换
set hidden

"显示所有buffer，按索引切换
map <F1> :ls<CR>:e #

"缩进完后仍保持可视模式
vnoremap < <gv
vnoremap > >gv

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>wq :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :q<cr>
nmap <silent> <leader>qa :qa<cr>

"一些快捷键
nmap j gj
nmap k gk

set so=5 "scrolloff
set ignorecase
set cursorline
" hi CursorLine    guibg=darkred

nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

nmap <leader><space> <C-b>
nmap <space> <C-f>

"插件管理插件
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
let g:pathogen_blacklist = []
execute pathogen#infect()

"PowerLine相关
set laststatus=2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
" 支持utf8 BOMB标记显示
let g:airline_section_y = '%{(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?",B":"")}%{strlen(&ff) > 0 ? "[".&ff."]" : ""}'
if has("win32")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10.5
  set guifontwide=新宋体:h11
endif
if has("gui_macvim")
  set guifont=Noto\ Mono\ for\ Powerline:h14
endif
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10.5
"set guifontwide=新宋体:h11


"Fenceview 编码自动检测
"nmap <leader>ff :FencAutoDetect<CR>
nmap <leader>fv :FencView<CR>
"关闭自动检测
let g:fencview_autodetect=0

"Mark 插件相关
let g:mwDefaultHighlightingPalette='extended'
"let g:mwDefaultHighlightingPalette='maximum'
"let g:mvDefaultHighlightingNum=9
nmap <leader>* <Plug>MarkSearchOrCurNext
nmap <leader># <Plug>MarkSearchOrCurPrev
nmap <Leader>n <Plug>MarkAllClear

"NerdTree插件
nmap <F3> :NERDTreeTabsToggle<CR>

"Tagbar插件
nmap <F4> :TagbarToggle<CR>

"ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
    cnoreabbrev ag Ack
endif
nmap <silent> <leader>ag :ag<CR>

" TagList插件
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function;m:member'
let tlist_js_settings = 'javascript;s:string;a:array;o:object;f:function'
"let Tlist_Ctags_Cmd='ctags.exe'
let Tlist_Ctags_Cmd='d:\ProgramFiles\Vim\vim74\ctags.exe'
let Tlist_Show_One_File = 1
set tags=tags;


" Web-indent 插件
let g:js_indent_log = 0

" vim-jsbeauty,depend on node.js
autocmd FileType javascript noremap <buffer>  <leader>ff :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <leader>ff :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <leader>ff :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>ff :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>ff :call CSSBeautify()<cr>
" vim-jsbeauty, visualmode
autocmd FileType javascript vnoremap <buffer>  <leader>ff :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <leader>ff :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <leader>ff :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>ff :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>ff :call RangeCSSBeautify()<cr>

autocmd FileType yaml :set filetype=ansible

nmap <F9> :w<CR>:!/usr/local/bin/python2 %<CR>
" python 一键运行
function CheckPythonSyntax()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
"   set efm 是设置quickfix的errorformat，以便vim识别
"  makeprg 是vim内置的编译命令，可以通过更改来实现编译对应类型文件。具体可参考vim官方说明文件。
"  copen是打开quickfix，n用来设置quichfix窗口大小，如 cope5。在错误描述上回车，可以直接跳转到错误行。
    let &makeprg     = mp
    let &errorformat = ef
endfunction
"一个是普通模式下，一个是插入模式下
au filetype python map <F5>  :call CheckPythonSyntax()<cr>
"au filetype python map <F11>  :w<cr> :call CheckPythonSyntax()<cr>
"au filetype python imap <F5> <ESC> :w <CR> :call CheckPythonSyntax() <CR>

"syntastic
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['jshint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

let g:syntastic_java_checkers = ['']

"pytho 自动补全
"if ! has("win32")
    "let g:pydiction_location = '/root/.vim/bundle/pydiction-master/complete-dict'
"endif

" Grep 插件
if has("win32")
    let Grep_Find_Path = 'D:\ProgramFiles\Gow\bin\gfind.EXE'
    let Grep_Xargs_Path = 'D:\ProgramFiles\Gow\bin\xargs.EXE'
    let Grep_Shell_Quote_Char = '"'
    "let Grep_Default_Filelist = '*.js *.html *.xml'
    let Grep_Default_Filelist = '*.h *.c *.cpp'
    "let Grep_Skip_Dirs = '.svn'
    "let Grep_Skip_Files = '*.bak'
endif
"对搜索的设置,搜索当前光标下的单词
nmap <silent> <leader>gr :call Search_Word()<CR>
" <CR>:copen<CR>
function Search_Word()
    let w = expand("<cword>") " 在当前光标位置抓词
    execute "Rgrep " w
endfunction

" match ErrorMsg '\s\+$'

" ycm
" let g:ycm_filetype_whitelist = { 'py': 1, 'js' : 1, 'sh' : 1 }
" let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_filetype_blacklist = {
      \ 'vue' : 1,
      \ 'netrw': 1,
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_log_level = 'info'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_python_binary_path = '/usr/local/bin/python2'
let g:ycm_key_invoke_completion = '<C-.>'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim indent guide
let g:indent_guides_enable_on_vim_startup = 1


" no plugin config
set path+=**
set wildmenu

" easy motion
if &runtimepath =~ 'vim-easymotion'
    nmap f <Plug>(easymotion-prefix)s
endif

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/dist,*/node_modules

" ultisnips, to prevent clash with youcompleteme, change snippet trigger
let g:UltiSnipsExpandTrigger='<c-j>'

colo molokai

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

autocmd BufRead scp://* :set bt=acwrite
autocmd BufWritePost scp://* :set bt=acwrite
