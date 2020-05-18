call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set bg=dark

" solid underscore
let &t_SI .= "\<Esc>[6 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" ESC immediately changes mode
set ttimeoutlen=0

" show menu options when tab completing
set wildmenu

" relative line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

filetype plugin on
filetype indent on

" case insensitivity on commands
set ignorecase

" highlight matching braces
set showmatch

" disable notifications
set noerrorbells
set novisualbell

" tab settings
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

"Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Bind CTRL+hjkl to switching panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
