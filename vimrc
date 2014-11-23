set nocompatible
" Color settings
colorscheme github
" Set vim to recognize 256 colors
if $TERM == "xtrm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnomre-terminal"
  set t_co=256
endif

"" General Settings
syntax enable                 " enable syntax highlighting
set ruler                     " show row and column numbers
set autochdir                 " always switch to current directory
set backupdir=~/.vim/backup   " set up backup directory
set directory=~/.vim/tmp      " temporary storage directory
" set background=dark           " assume a dark background
set history=500               " sore a lot of history
set hidden                    " allow buffer switching without savinset nocompatible
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
set noexpandtab               " use tabs, not spaces (optional)
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

"""""""""""""""""""""""""""""""""""""""""""""
" Vim-R 

" To open R in terminal rather than RGui (only necessary on OS X)
" let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell' 
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R 
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

" set folding scheme; more on this see: 
" http://www.dgp.toronto.edu/~mjmcguff/learn/vim/folding.txt
" http://vim.dindinx.net/orig/usr_28.txt
"set foldcolumn=0 " if set to > 1 together with 'set number', then the copy&paste of screen will include the line numbers
"highlight Folded ctermfg=yellow ctermbg=blue
" highlight  works only when colorscheme is uncommented
"set foldmethod=indent
"hi FoldColumn ctermbg=NONE

" For Latex work: open *.pdf files in evince/xpdf upon opening of *.tex files in vim 
" more on this on this page: http://ubuntuforums.org/showthread.php?p=5351607
au BufRead *.tex silent !xpdf %<.pdf 2>/dev/null &
au BufRead *.Rnw silent !xpdf %<.pdf 2>/dev/null &

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" Sort function from Gerald Lai at http://www.vim.org/tips/tip.php?tip_id=923 (use last
" script on page, not first!!!!!).
" paste in vimrc file - tested with GVim 6.3

"** use visual block <Ctrl-V> to select lines to sort and hit <F3> **
vmap <F3> :call Sort(Prompt("0","1"),Prompt("1","f"),"Strcmp")<CR>

"sort lines function
function Sort(wnum, order, cmp) range
  normal `<
  execute "let startcol = col(\".\")"
  normal `>
  execute "let endcol = col(\".\")"
  if startcol <= endcol
    let firstcol = startcol
    let lastcol = endcol
  else
    let firstcol = endcol
    let lastcol = startcol
  endif

  call SortR(a:firstline, a:lastline, firstcol, lastcol, a:wnum, a:order, a:cmp)
  normal gv
endfunction

"sort lines recursively
function SortR(start, end, first, last, wnum, order, cmp)
  if a:start >= a:end
    return
  endif

  let partition = a:start - 1
  let middle = partition
  let partstr2 = Words2(getline((a:start + a:end) / 2), a:first, a:last, a:wnum)
  let i = a:start

  while i <= a:end
    let str = getline(i)
    let partstr = Words2(str, a:first, a:last, a:wnum)
    if a:order == "r"
      execute "let result = ".a:cmp."(partstr2, partstr)"
    else
      execute "let result = ".a:cmp."(partstr, partstr2)"
    endif

    if result <= 0
      "swap i before partition
      let partition = partition + 1

      if result == 0
        let middle = partition
      endif

      if i != partition
        let str2 = getline(partition)
        call setline(i, str2)
        call setline(partition, str)
      endif
    endif

    let i = i + 1
  endwhile

  "make sure middle element at end of partition
  if middle != partition
    let str = getline(middle)
    let str2 = getline(partition)
    call setline(middle, str2)
    call setline(partition, str)
  endif

  call SortR(a:start, partition - 1, a:first, a:last, a:wnum, a:order, a:cmp)
  call SortR(partition + 1, a:end, a:first, a:last, a:wnum, a:order, a:cmp)
endfunction

"determine compare strings
function Words2(line, first, last, wnum)
  if a:wnum == "v"
    return strpart(a:line, a:first - 1, a:last - a:first + 1)
  elseif a:wnum > 1
    return strpart(a:line, matchend(a:line, "\\s*\\(\\S*\\s*\\)\\{".(a:wnum - 1)."}"))
  elseif a:wnum == 1
    return strpart(a:line, matchend(a:line, "\\s*"))
  elseif a:wnum < 0
    return matchstr(a:line, "\\(\\S*\\s*\\)\\{".(-a:wnum)."}$")
  else
    return a:line
  endif
endfunction

"compare two strings
function Strcmp(str1, str2)
  if a:str1 < a:str2
    return -1
  elseif a:str1 > a:str2
    return 1
  else
    return 0
  endif
endfunction

"prompt user for settings
function Prompt(str, ...)
  let default = a:0 ? a:1 : ""
  if a:str == "0"
    let str = "Sort by which word [(0)whole line (<0)count from right (v)isual]? "
  elseif a:str == "1"
    let str = "Order [(f)orward (r)everse]? "
  endif

  execute "let ret = input(\"".str."\", \"".default."\")"

  return ret
endfunction 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
