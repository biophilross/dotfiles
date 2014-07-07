" Color settings
colorscheme pablo
" Set vim to recognize 256 colors
if $TERM == "xtrm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnomre-terminal"
  set t_co=256
endif

"" General Settings
syntax enable                 " enable syntax highlighting
set autochdir                 " always switch to current directory
set backupdir=~/.vim/backup   " set up backup directory
set directory=~/.vim/tmp      " temporary storage directory
" set background=dark           " assume a dark background
set history=500               " sore a lot of history
set hidden                    " allow buffer switching without saving
set mousehide                 " automatically hide mouse cursor while typing
set encoding=utf-8            " character encoding
set showcmd                   " display incomplete commands
set number                    " line numbers on
set showmode                  " display current mode
set cursorline                " highlight current line
highlight clear SignColumn    " Sign Column should match the background of things
set showmatch                 " show matching brackets/parentheses
set autoindent                " indent at the same level of the previous line
if has ('persistent_undo')    
  set undofile                " maximum number of changes that can be undone
  set undodir=~/.vim/un       " set undo file directory
  set undolevels=1000         " mximum number of lines to save for undo on
  set undoreload=10000        " a buffer reload
endif                 
set foldmethod=indent         " fold based on indent
set nofoldenable              " don't fold by default

"" Whitespace
set wrap                      " wrap lines
set tabstop=2 shiftwidth=2    " a tab is two spaces (or set this to 4)
set expandtab                 " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode
set softtabstop=2             " let backspace delete indent

"" Searching
set hlsearch                  " highlight matches
set incsearch                 " incremental searching
set ignorecase                " search are case insensitive
set smartcase                 " ... unless they contain at least one capital letter

"" Key (re)Mappings

" Set leader to ',' instead of \
let mapleader = ','

" Quickly switch to .vimrc
command Vimrc edit ~/.vimrc

" Easier moving in tabs and windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" Wrapped lines gows down/up to next row, rather than next line in file
nnoremap j gj
nnoremap k gk

" Adjust viewports to the same size
map <leader>= <C-w>=
" Use this to remove highlighting from your currrent search
nmap <leader>q :nohlsearch<CR>

" Double percentage sign in command mode is expanded to "
" directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

" Map tab keys
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-c> :tabclose<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" map the function keys to switch tabs
nnoremap <f2> 1gt
nnoremap <f3> 2gt
nnoremap <f4> 3gt
nnoremap <f5> 4gt
nnoremap <f6> 5gt
nnoremap <f7> 6gt
nnoremap <f8> 7gt
nnoremap <f9> 8gt
nnoremap <f10> 9gt
nnoremap <f11> 10gt
nnoremap <f12> 11gt

" Center on searches
map N Nzz
map n nzz 
