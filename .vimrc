" ======================== NeoBundle Setup ========================
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'wincent/command-t'
 NeoBundle 'Townk/vim-autoclose'
 NeoBundle 'vim-scripts/Conque-Shell'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'sjl/gundo.vim'
 NeoBundle 'vim-scripts/matchit.zip'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'garbas/vim-snipmate'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'godlygeek/tabular'
 NeoBundle 'tomtom/tlib_vim'
 NeoBundle 'tony/tmux-config'
 NeoBundle 'tpope/vim-abolish'
 NeoBundle 'MarcWeber/vim-addon-mw-utils'
 NeoBundle 'tpope/vim-cucumber'
 NeoBundle 'tpope/vim-endwise'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'tpope/vim-haml'
 NeoBundle 'pangloss/vim-javascript'
 NeoBundle 'plasticboy/vim-markdown'
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'vim-ruby/vim-ruby'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'nelstrom/vim-textobj-rubyblock'
 NeoBundle 'kana/vim-textobj-user'
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'vimwiki/vimwiki'
 NeoBundle 'mattn/calendar-vim'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

" ======================== Configs  ========================

let mapleader=","
"{{{Auto Commands

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')


" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

"}}}

map <leader>n :NERDTreeToggle<CR>
set grepprg=grep\ -nH\ $*
set wildignore=*.o,*~,*.pyc

filetype on " Automatically detect file types.
set nocompatible " no vi compatibility.
syntax enable
set cf " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=500 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set ruler " Ruler on
set nu " Line numbers on
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
" Formatting
set ts=2 " Tabs are 2 spaces
set bs=2 " Backspace over everything in insert mode
set shiftwidth=2 " Tabs under smart indent
set nocp incsearch

set cindent
set cinoptions=:0,p0,t0,j1
set si
set cinwords=if,else,while,do,for,switch,case
set cinkeys="0{"

set formatoptions=tcqr
set autoindent
set smarttab
set expandtab
set smartindent



" Visual
set showmatch " Show matching brackets.
set mat=5 " Bracket blinking.
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set noerrorbells " No noise.
set laststatus=2 " Always show status line.
map <leader>pm :setlocal paste!<cr>
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
function! HasPaste()
    if &paste
        return 'Paste Mode '
    en
    return ''
endfunction

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set nostartofline
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set tabstop=2
set magic
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>e :edit<CR><CR>
set t_Co=256
set background=dark
colorscheme molokai
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
nnoremap j gj
nnoremap k gk
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ss :w<CR>
nmap <silent> <leader>qq :q<CR>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabedit %<CR>
map <C-s> :w<cr>
set guioptions=aem
if has ('gui_running')
  set guifont=Meslo\ LG\ M\ DZ\ Regular:h12
endif
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif

map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <leader>. <C-W>=
nnoremap <leader>pp diw"0P
nnoremap <leader>sp diw"0p
nnoremap <leader>qq :q<cr>
nnoremap <leader>wq :wq<cr>




" java indent macro
"imap <leader>m <c-[>@z
"let @z = 'a{€ku  '

"esc
set timeout timeoutlen=1000 ttimeoutlen=100
inoremap jk <c-[>
inoremap jf <c-[>:w<CR>
"fast todo
map <leader>td o#TODO<Esc>
map <leader>tD O#TODO<Esc>

"\n insert
map <leader>j o<ESC>^

map <leader>o :CtrlP<cr>

" python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd FileType python setlocal shiftwidth=4 tabstop=4
" /python



" auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote<cr>
:autocmd FileType vimwiki map <leader>g :VimwikiDiaryGenerateLinks<cr>
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<cr>
