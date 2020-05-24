call plug#begin('~/.vim/plugged')
" Themes
Plug 'nightsense/stellarized'
Plug 'scheakur/vim-scheakur'
Plug 'liuchengxu/space-vim-theme'
Plug 'kjssad/quantum.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/Fruidle'

Plug 'preservim/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
call plug#end()

" Folds
set foldmethod=syntax
set foldnestmax=2
set foldcolumn=1  " Show fold indicators

" Misc stuff
set wildmenu            " Show completion matches
set lazyredraw          " Do not redraw screen while a macro is executing
set magic               " make regex behave
set ttimeoutlen=0       " immediate input after hitting escape
set hidden              " Keep files open even if not in a window.
set number              " Show absolute line number @ cursor
set relativenumber      " Show relative line numbers
set cursorline          " highlight current line
set showcmd             " show keystrokes / commands in status bar
syntax enable
set encoding=utf-8
set ffs=unix,dos,mac    " Default line endings + autodetect
set history=200
set ruler               " show line and column numbers
set belloff=all
set noerrorbells
"set colorcolumn=100
"match ColorColumn "\%>99v.\+"   " Highlight column 100+

" Theme/colors
set t_Co=256
set background=dark
set termguicolors
" Disable BCE (fixed background colors)
set t_ut=
colorscheme gruvbox

" Searching
set ignorecase          " Ignore case while searching
set hlsearch            " Highlight search results
set incsearch           " Live search while typing. CTRL+G, CTRL+T to go to next/previous matches

" Bindings
" Disable highlighting by pressing spacebar
noremap <space> :noh<CR>
" Splits/buffer management/navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Temporarily disable search highlighting when in insert mode
:augroup clearSearchHighlighting
:   autocmd!
:   autocmd InsertEnter * :set nohlsearch
:   autocmd InsertLeave * :set hlsearch
:augroup END

" Disable backups
set nobackup
set nowb
set noswapfile

" Tabs/indentation
set expandtab           " Spaces > tabs
set smarttab            " Backspace a tab at a time when applicable
set shiftwidth=4        " Tab size
set tabstop=4
set nowrap              " No line wrapping
set autoindent          " Keep same indent level after CR in edit mode
set smartindent         " Increase indentation level in a new block

" Go to last edit position when opening file
:augroup restoreCursor
:   autocmd!
:   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
:augroup END

" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Vertical bar cursor when in insert mode
let using_konsole=$USING_KONSOLE
if using_konsole == '1'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else " &term =~ '^xterm*\|rxvt'
    let &t_SI .= "\<Esc>[6 q"
    let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

" Set tab size for webdev
:augroup webDevSettings
:  autocmd!
:  autocmd BufRead,BufNewFile *.html,*.vue,*.js,*.css,*.scss,*.pug,*.purs,*.ts set shiftwidth=2 softtabstop=2 expandtab
:  autocmd BufRead,BufNewFile *.vue :set syntax=html
:  autocmd BufNewFile,BufRead *.html.tera set syntax=html shiftwidth=2 softtabstop=2 expandtab
:augroup END


" Automatically change to absolute numbers when not in focus and in insert mode.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

" Rust stuff
let g:rustc_path = "/usr/bin/rustc"
let g:rust_fold = 1
let g:rustfmt_autosave = 1
let g:rust_bang_comment_leader = 1

" tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi

" tagbar
nmap <F8> :TagbarToggle<CR>

" Turns on word wrap
fun! EssayMode()
    set showbreak=>\ 
    set wrap
    set lbr
endfun

" Light theme
fun! GoLight()
    colorscheme fruidle
    set termguicolors
    set background=light
    set t_Co=256
    set t_ut=
endfun

" Dark theme
fun! GoDark()
    colorscheme gruvbox
    set termguicolors
    set background=dark
    set t_Co=256
    set t_ut=
endfun

" Fixup colors (always put this last)
if (has("termguicolors"))
  set termguicolors
endif

