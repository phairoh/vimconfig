let mapleader = ","
let maplocalleader = "\\"

execute pathogen#infect()
syntax on
filetype plugin indent on

" Global Variables
" Turn on highlighted search. Use :noh to clear highlighting
set hlsearch
" Turn on incremental search
set incsearch
" Allow buffers to be hidden without saving
set hidden
" Line number on current line and relative number elsewhare
set number relativenumber

" Personal Keybinds
" Easy navigation between open windows
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
" Quicker scrolling throw a page
nnoremap <c-j> 10j
nnoremap <c-k> 10k
xnoremap <c-j> 10j
xnoremap <c-k> 10k
" Quickly exit insert mode
inoremap jk <esc>
inoremap <esc> <nop>
" Quickly edit and load vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Close current buffer without closing window
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" NERDtree tabs keymaps
nmap <leader>t <plug>NERDTreeTabsToggle<CR>
nmap <leader>f <plug>NERDTreeTabsFind<CR>
" Undotree keymaps
nnoremap <leader>u :UndotreeToggle<CR>

" Tab Settings
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" gui settings
if has('gui_running')
	let g:nerdtree_tabs_open_on_gui_startup = 0
	" set initial window size
	set lines=40 columns=150

	" hide menu (m) toolbar (T) scrollbar (r) lefthand scrollbar when split (L)
	set go-=m go-=T go-=r go-=L
	if has('gui_win32')
		set encoding=utf-8
		let g:airline_power_fonts = 1
		"set gfn=Fira_Mono_Regular_for_Powerline:h10
		set gfn=Powerline_Consolas:h10
		" set backup and swap directories
		set backupdir=~/vimfiles/tmp/backup//
		set dir=~/vimfiles/tmp/swap//
	endif
	colorscheme wombat
else
	let g:nerdtree_tabs_open_on_console_startup = 0
	" set backup and swap directories - non gui so i'm probably on osx/linux
	set backupdir=~/.vim/tmp/backup//
	set dir=~/.vim/tmp/swap//
	" airline settings
	let g:airline_powerline_fonts = 1
	colorscheme wombat256
endif

" airline ctrl-space settings
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
" for some reason this allows for airline to show up even when only 1 window
" is open
set laststatus=2
