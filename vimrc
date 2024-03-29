" ======================
" vim configuration file
" @author suzuken (https://github.com/suzuken)
"
" README file is here:
"
" suzuken/dotfiles - GitHub
" https://github.com/suzuken/dotfiles
"
" Sorry for writing some comments in Japanese, and I'll translate to English
" later.
" ======================

set nocompatible               " be iMproved
filetype off                   " required!

if !isdirectory(expand("~/.vim/bundle/vundle"))
    !mkdir -p ~/.vim/bundle
    !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    let s:bootstrap=1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Plugin Installing
Bundle 'gmarik/vundle'
Bundle 'mattn/webapi-vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Gist.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Rainbow-Parenthesis'
Bundle 'taglist.vim'
Bundle 'Shougo/unite.vim'
Bundle 'surround.vim'
Bundle 'ref.vim'
Bundle 'PDV--phpDocumentor-for-Vim'
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/vimproc'
Bundle 'mattn/zencoding-vim'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'h1mesuke/unite-outline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Modeliner'
Bundle 'tsukkee/unite-tag'
Bundle 'tpope/vim-fugitive'
Bundle 'sudo.vim'
Bundle 'smartchr'
Bundle 'tsaleh/vim-align'
Bundle 'SQLUtilities'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-guicolorscheme'
Bundle 'plasticboy/vim-markdown'
Bundle 'thinca/vim-quickrun'
Bundle 'TwitVim'
Bundle 'ack.vim'
Bundle 'ShowMarks'
Bundle 'YankRing.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/benchvimrc-vim'

if exists("s:bootstrap") && s:bootstrap
    unlet s:bootstrap
    BundleInstall
endif

filetype plugin indent on     " required!

" =================
" showmarks_include
" =================
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" ===========
" " powerline
" ===========
let g:Powerline_symbols = 'fancy'

"==========================
"init
"==========================
autocmd!
set modelines=5

"leaderを,に変更
" leader is ,
let mapleader = ","

"==========================
"Tab Char
"==========================
set tabstop=4
set expandtab
set softtabstop=0
set shiftwidth=4
set smarttab


"==========================
"Tab Pages
"==========================
nnoremap <C-t>  <Nop>
nnoremap <C-t>n  :<C-u>tabnew<CR>
nnoremap <C-t>c  :<C-u>tabclose<CR>
nnoremap <C-t>o  :<C-u>tabonly<CR>
nnoremap <C-t>j  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <C-t>k  gT

"==========================
"tags-and-searches
"==========================
" nnoremap t  <Nop>
" nnoremap tt  <C-]>
" nnoremap tj  :<C-u>tag<CR>
" nnoremap tk  :<C-u>pop<CR>
" nnoremap tl  :<C-u>tags<CR>

"==========================
"view
"==========================
if has('gui_running')
    set t_Co=16
    let g:solarized_termcolors=16
    colorscheme solarized
    " call togglebg#map('<F5>')
endif

" when running on terminal, modify colorscheme
colorscheme slate

set number
set title
"set visualbell
set scrolloff=5

if v:version >= 700
    set cursorline
    " highlight CursorLine guibg=lightblue ctermbg=lightgray
endif

"vim 7.3~
if v:version >= 730
    set relativenumber  "showing relative column number
    set undofile    "creating <FILENAME>.un~
endif
set cmdheight=2

" ======
"  font
" ======
if has("gui_gnome")
    set guifont=Ricty\ 12
end

"==========================
"Searching and Moving
"==========================
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault    " always %s/hoge/foo/ means %s/hoge/foo/g
set incsearch
set showmatch
set hlsearch
set wrapscan

" get back from search mode
"
nnoremap <Esc><Esc> :nohlsearch<CR>

"%の移動をtabでも可能に。
" tab means %
nnoremap <tab> %

"Visual ModeでのTab/shift+Tab indent/unindentをハイライトされたブロックに対し
"て行う。
" In visual mode, tab means insert <tab> into highlighted block.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"検索パターン入力中は/および?をエスケープ
"そのまま入力するには<C-v>{/?}で
" always escape / and ? in search character.
cnoremap <expr> /
            \ getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?
            \ getcmdtype() == '?' ? '\?' : '?'

"==========================
"Handling long lines
"==========================
set wrap

set formatoptions=qrn1
if v:version >= 730
    set colorcolumn=85 "色づけ
endif

"==========================
"Key Bind
"==========================
"vimrcをリローダブルにする
" reload vimrc
noremap <C-c><C-c> <C-c>
noremap <C-c><C-e>e :edit $HOME/.vimrc<CR>
noremap <C-c><C-e>s :source $HOME/.vimrc<CR>

" 検索箇所を真ん中に
" when move to search results, move to center.
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz


"F1もESCにする
" F1 means ESC, too.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap <C-j> <ESC>
nnoremap <C-j> <ESC>
vnoremap <C-j> <ESC>

"ノーマルモードではセミコロンをコロンに。
nnoremap ; :

"フォーカスを失ったら自動的に上書き。
au FocusLost * :wa

"insertモードでjj押せばノーマルモードに。
" in insert mode, jj means <ESC>.
inoremap jj <ESC>

",wで水平分割→アクティブに
" <leader>w means split and activate.
nnoremap <leader>w <C-w>v<C-w>l

"F2でpasteモードに。pasteするときにインデントを無効化。
" <F2> to paste mode.
set pastetoggle=<F2>

"splitの移動を簡単に。ctrl押しながらhjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Enterでいつでも一行挿入
" <Enter> always means inserting line.
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yyPVr*jyypVr*
nnoremap <leader>3 yyPVr-jyypVr-
nnoremap <leader>4 yypVr=
nnoremap <leader>5 yypVr-
nnoremap <leader>6 yypVr^
nnoremap <leader>7 yypVr"

"registerとmarkの確認を楽にする
"http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap <Space>m :<C-u>marks
nnoremap <Space>r :<C-u>registers

"BundleSearchへのショートカット
" Shortcuts for BundleSearch
nnoremap <Space>s :BundleSearch<Space>

" TagListを表示
" representing TagList.
nnoremap <leader>t :Tlist<CR>

" NERDTreeを表示
" representing NERDTree
nnoremap <leader>n :NERDTree<CR>

" default key-bind of opening comamnd-line window makes typo frequently.
" So, using qqq prefix for those.
nnoremap qqq: <Esc>q:
nnoremap qqq/ <Esc>q/
nnoremap qqq? <Esc>q?
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

"==========================
"language
"==========================

set encoding=utf-8
source $HOME/.vim/encode.vim

set fileformats=unix,dos,mac

"ambiwidthがある場合、doubleに設定
if exists('&ambiwidth')
    set ambiwidth=double
endif

"==========================
"Folding
"==========================
" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=0            " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()
" }}}

" ******************************
"            Leader
" ******************************
" white spaceをtrailする
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Ackへのショートカット
nnoremap <leader>a :Ack
" htmlで良く使う。タグに囲まれたものを一気に選択。
nnoremap <leader>ft Vatzf
" CSSプロパティを並べ替え
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" TextMateの<Ctrl-Q>。ワンライナーに書き換え。
nnoremap <leader>q gqip
" 直前に貼り付けたコードを再選択。インデントとか入れるときに便利。
nnoremap <leader>v V`]


"==========================
"clipboard
"==========================
set clipboard+=autoselect


"==========================
"special Key
"==========================
set list
set listchars=tab:>-,trail:-,extends:<,precedes:<
highlight specialKey ctermfg=darkgray


"==========================
"Input
"==========================
set backspace=indent,eol,start
set formatoptions+=mM
set autoindent
set smartindent

"==========================
"Command
"==========================
set wildmenu
set wildmode=full:list
"set completeopt=menu,preview,menuone

"==========================
"Programming
"==========================
set showmatch "対応する括弧を表示
"set cindent "Cのインデント
set foldmethod=syntax
set grepprg=internal "内蔵grep

"==========================
"Backup
"==========================
set autowrite
set hidden
set backup
set backupdir=$HOME/.vimback
set directory=$HOME/.vimtmp
set history=10000
set updatetime=500
"set viminfo=""
let g:svbfre = '.\+'
"autocmd CursorHold * call NewUpdate()

"==========================
"Status Line
"==========================
set showcmd "ステータスラインにコマンドを表示
set laststatus=2 "ステータスラインを常に表示
set statusline=[%L]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L "ステータスラインの表示内容


"==========================
"Window
"==========================
set splitright "Window Split時に新Windowを右に表示
set splitbelow "Window Split時に新windowを下に表示

"==========================
"Dictionary
"==========================
set dictionary=/usr/share/dict/words
autocmd FileType php :set dictionary=~/.dictionary/phpdoc

"==========================
"File Type
"==========================
syntax on "シンタックスハイライト
au FileType perl call PerlType()
"" ファイルタイプに応じてテンプレートを自動読み込み
autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
" バッファを開いた時に、カレントディレクトリを自動で移動
" autocmd BufEnter * execute ":lcd " . expand("%:p:h")



"visualeditの設定
"set virtualedit+=block

" ---------------------------
"python
" ---------------------------
if has('autocmd')
    autocmd FileType python setl autoindent
    autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
endif

" Execute python script C-P
function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>

" ----
" html
" ----
if has('autocmd')
    autocmd FileType html :compiler tidy
    autocmd FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
endif

" ---
" css
" ---
if has('autocmd')
    autocmd FileType css :compiler css
endif

"==========================
"help
"==========================
set helplang=ja,en "日本語のヘルプｰ>英語のヘルプの順に検索

" open help page to vertical window
nnoremap :h :vert h<space>
nnoremap ;h :vert h<space>
nnoremap :help :vert help<space>
nnoremap ;help :vert help<space>


"**************************
"plugin
"**************************

"==========================
"ref.vim
"==========================
let g:ref_phpmanual_path=$HOME . '/.dictionary/phpdoc/'
"let g:ref_jquery_path=$HOME/dictionary/jquery
let g:ref_phpmanual_cmd="w3c -dump %s"
let g:ref_use_vimproc=0
let g:ref_jquery_cmd="w3c -dump %s"
let g:ref_alc_cmd="w3c -dump %s"

"Ref alcへのmap
nnoremap <space>ra :<C-u>Ref alc<Space>
nnoremap <space>rp :<C-u>Ref phpmanual<Space>


"==========================
"neocomplecache
"==========================

let g:acp_enableAtStartup = 0 "AutoComplPopを無効化
let g:neocomplcache_enable_at_startup = 1 "neocomplcacheを起動時に有効化
" let g:neocomplcache_enable_smart_case = 1 "大文字小文字を区別しない
"let g:neocomplcache_enable_camel_case_completion= 1 "camel caseを有効化。大文字を区切りとしたワイルドカードみたいなもの
let g:neocomplcache_enable_underbar_completion= 1 " _の補完を有効にする
let g:neocomplcache_min_syntax_length = 3 " シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_lock_buffer_name_pattern= '\*ku\*' "neocomplcacheを自動的にロックするバッファ名のパターン

"Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" スニペットファイルの配置場所
let g:NeoComplCache_SnippetsDir = '~/.vim/snippets'

" ==============
" neocomplcache
" Plugin key-mappings
" ==============
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" <CR>: popupを削除
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" <TAB>: completion.
" If the popup  is already shown, move cursor to next target.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" filename completion
" inoremap <expr><C-x><C-f> neocomplcache#manual_filename_complete()

"オムニ補完
" inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_filename_complete()

" =============
" neocomplcache
" command
" =============
"Nesでスニペットを編集
command! -nargs=* Nes NeoComplCacheEditSnippets


" ========
" Quickrun
" ========
" Initialization
let g:quickrun_config = {}

"==========================
"NERDcommenter.vim
"==========================
let NERDSpaceDelims = 1
let NERDShutUp = 1


"==========================
"unite.vim
"==========================
"Key Map
"
"fc: list around about current dir
"fb: list around buffer dir
"fr: list register
"fo: list outline
"ff: list unite source
"fl: list colorscheme and selection

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>
" @see https://github.com/h1mesuke/unite-outline
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" @see https://github.com/ujihisa/unite-colorscheme
nnoremap [unite]l :<C-u>Unite -auto-preview colorscheme<CR>
" @see https://github.com/tsukkee/unite-tag
" searching tag by words on cursor.
nnoremap <silent> [unite]u  :<C-u>Unite -immediately -no-start-insert tag:<C-r>=expand('<cword>')<CR><CR>
" show tags
nnoremap <silent> [unite]t  :<C-u>Unite tag<CR>


autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  " Start insert.
  " let g:unite_enable_start_insert = 0
endfunction

let g:unite_source_file_mru_limit = 200
let g:unite_enable_split_vertically = 0 "vertical split

" =====================================================
"" (ctags)
" =====================================================
set tags=tags
let g:tlist_javascript_settings='javascript;f:function;c:class;m:method'


"----------------------------------------------------
"" SQL Utilities
"----------------------------------------------------
let g:sqlutil_load_default_maps = 0

vmap <leader>sf        <Plug>SQLUFormatter<CR>
" nmap <leader>scl       <Plug>SQLU_CreateColumnList<CR>
" nmap <leader>scd       <Plug>SQLU_GetColumnDef<CR>
" nmap <leader>scdt      <Plug>SQLU_GetColumnDataType<CR>
" nmap <leader>scp       <Plug>SQLU_CreateProcedure<CR>

"Set comma align
let g:sqlutil_align_comma = 1


" =====
" after
" =====
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
"----------------------------------------------------
"" host specific
"----------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
