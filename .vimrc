execute pathogen#infect()
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
filetype plugin indent on
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
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

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

filetype indent plugin on
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
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <C-s> :w<cr>
set guioptions=aem
if has ('gui_running')
  set guifont=Meslo\ LG\ M\ DZ\ Regular:h12
endif
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <leader>pp diw"0P
nnoremap <leader>sp diw"0p
nnoremap <leader>qq :q<cr>
nnoremap <leader>wq :wq<cr>
