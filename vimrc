" .vimrc, http://github.com/phairoh/vimconfig
" Aaron Trachtman (phairoh@gmail.com)
"
" adapted from  http://github.com/euclio/vim-settings
"
" =============================================================================
" Setup
" =============================================================================
"
" Use utf-8 everywhere
set encoding=utf8
scriptencoding utf8

" Store vim configuration in $XDG_CONFIG_HOME
let $VIMHOME=$XDG_CONFIG_HOME . '/vim'
set runtimepath+=$VIMHOME,$VIMHOME/after
let $MYVIMRC=$VIMHOME . '/vimrc'

" Store vim caches (swp files) in $XDG_CACHE_HOME
let $VIMCACHE=$XDG_CACHE_HOME . '/vim'
let $VIMDATA=$XDG_DATA_HOME . '/vim'

" Set tmp directory (swp files)
set directory=$VIMCACHE,$TMP

" Save viminfo in the data directory
let viminfodir = $VIMDATA
if !isdirectory(viminfodir)
    call mkdir(viminfodir, 'p')
endif
" This sets the viminfo setting.  :h viminfo for more details
" Not quite sure why we use let &viminfo instead of set viminfo
let &viminfo="'100,<50,s10,h,n" . viminfodir
if has('nvim')
    let  &viminfo.='/info.shada'
else
    let &viminfo.='/info'
endif

" Store undo history across sessions
if v:version >= 703
    let &undodir=$VIMDATA . '/undodir'
    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
    set undofile
endif

" Store netrw history in cache
" NERDTree is a replacement for netrw.  Not sure if this will do anything with
" NERDTree installed
let g:netrw_home=$VIMDATA

" Change leader to comma
let mapleader = ","
" Change local leader to backslash. local leader is used with commands that
" require the leader inside of plugins
let maplocalleader = "\\"

" Install plugins.  This uses vim-plug plugin manager
source $VIMHOME/plugins.vim

" Update plugins
nnoremap <silent> <leader>pu :PlugUpdate<cr>

" Set filetype specific indentation
filetype plugin indent on

" Enable syntax highlighting. sync info found at :h syn-sync
syntax enable
syntax sync minlines=250

" =============================================================================
" Functions
" =============================================================================

function! GenerateUuid()
    if executable('uuidgen')
        let l:new_uuid=system('uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"')
        return l:new_uuid
    endif
endfunction

nnoremap <Leader>u i<C-R>=GenerateUuid()<cr><esc>

" =============================================================================
" File settings
" =============================================================================
" Use Unix line endings by default.
set fileformats=unix,dos,mac

" Set column width to 80 characters
set textwidth=80

" Set tabs to 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Autoformat comments into paragraphs when modifying text.
" :help fo-table for information on options
set formatoptions=cqrj

" Assume that .tex files are LaTeX
" I obviously don't use LaTeX too much... but I'll keep this in in case I choose
" to do so
let g:tex_flavor='latex'

" Use one space when joining lines
set nojoinspaces

" Set default dictionary to english
set spelllang=en_us

" =============================================================================
" Editing Window Improvements
" =============================================================================
" Show line numbers
set number relativenumber

" Hide line numbers when entering diff mode
" I don't use diff mode, but maybe I will?
" Don't really understand how this works...
augroup hide_lines
    autocmd!
    autocmd FilterWritePre * if &diff | set nonumber norelativenumber | endif
augroup END

" When leaving buffer, hide it instead of closing it
" Allow buffers to be hidden without saving
set hidden

" Statusline settings
" Previously just had set laststatus=2
set laststatus=2 noshowmode showcmd cmdheight=2

" Ensure that the cursor is at least 5 lines above bottom
set scrolloff=5

" Show arrows when there are long lines, and show · for trailing space
" Will have to test this out to see if I like it
set list listchars=tab:»·,trail:·,precedes:←,extends:→

" wildmenu is tab completion at the command line
set wildmenu

" On first tab, complete the longest common command. On second tab, cycle menu
set wildmode=longest,full

" Files to ignore for wildmenu
set wildignore=*.o,*.pyc,*.class,*.bak,*~

" =============================================================================
" Motions
" =============================================================================
" Disable arrow keys; hjkl are way better anyways!
" I actually really like this idea since I don't really use them anyway
noremap  <up>    <nop>
inoremap <up>    <nop>
noremap  <down>  <nop>
inoremap <down>  <nop>
noremap  <left>  <nop>
inoremap <left>  <nop>
noremap  <right> <nop>
inoremap <right> <nop>

" Press escape to exit terminal
if has('nvim')
    "tnoremap <Esc> <C-\><C-n>
endif

" Backspace works as expected across lines
set backspace=indent,eol,start

" Make searching make sense:
" hlsearch:   Turn on highlighted search. Use :noh to clear highlighting
" incsearch:  Turn on incremental search
" ignorecase: ignore case in search...
" smarcate:   ...except when using upper case
set hlsearch incsearch ignorecase smartcase

" =============================================================================
" New Commands
" =============================================================================

" F9 opens .vimrc in a new window
map <f9> :split $MYVIMRC<cr>
" F10 opens plugins.vim in a new window
map <f10> :execute 'sp $VIMHOME/plugins.vim'<cr>

" <leader>q clears highlighting
nnoremap <leader>q :nohlsearch<cr>

" <leader>d deletes without filling the yank buffer
" Holy crap didn't know this existed!
nmap <leader>d "_d
vmap <leader>d "_d

" Navigate through windows using <leader> + simple movement
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" <ctrl> + simple movement moves 10 instead of 1
nnoremap <c-j> 10j
nnoremap <c-k> 10k
xnoremap <c-j> 10j
xnoremap <c-k> 10k

" Use jk to exit insert mode and disable <ESC> so I don't use it anymore
inoremap jk <esc>
inoremap <esc> <nop>

" In visual mode, > and < will indent and then re-hightlight
" < and >: shift the text
" gv:      reselect last visual selection
vnoremap > >gv
vnoremap < <gv

" <ctrl> + n or p moves through buffers
" <leader> b moves to last buffer
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprev<cr>
nnoremap <leader>b :b#<cr>

" =============================================================================
" Fix Annoyances
" =============================================================================
" These are directly copied from reference vimrc.  Commenting most of them out
" until I understand what they do

" Disable visual and audio bell
"set noerrorbells visualbell t_vb=

" Don't make backups or swaps
set nobackup noswapfile

" Make regex a little easier
"set magic

" Custom Terminal title
"let &titlestring=hostname() . ' : %F %r: VIM %m'
"set title

" Let vim reload files after shelling out
set autoread

" Don't show the scratch buffer during completions
"set completeopt-=preview

" Show mode changes faster
"set ttimeoutlen=50

" Jump to the last known cursor position when opening a file
"augroup last_cursor_position
"autocmd!
"autocmd BufReadPost *
"\ if line("'\"") > 1 && line("'\"") <= line("$") |
"\     execute "normal! g`\"" |
"\ endif
"augroup END

" Unfold all folds by default
"set nofoldenable

" Allow the virtual cursor to move one space beyond actual text
set virtualedit=onemore

" Toggle showing tabs and expanding tabs, in the case that the file already
" uses tabs. Mnemonic: tt = toggle tab
"nnoremap <leader>tt :set expandtab! list!<CR>

" Enable mouse in all modes
set mouse=a

" Make Y behavior consistent with C and D
"nnoremap Y y$

" =============================================================================
" Colorscheme
" =============================================================================
" Use a dark colorscheme.  This should get set to dark from my color scheme
set background=dark
if &t_Co>=88
    silent! colorscheme wombat256
else
    colorscheme default
endif

" Allow local configuration to override
if filereadable(expand('~/.vimrc_local'))
    source ~/.vimrc_local
endif

