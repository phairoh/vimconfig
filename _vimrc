
let mapleader = ","

execute pathogen#infect()
syntax on
filetype plugin indent on 
" allows closing buffers without saving
set hidden
" Global Variables
" Turn on highlighted search. Use :noh to clear highlighting
set hlsearch

" Personal Keybinds
" Easy navigation between open windows
nmap <Leader>h <C-W><C-H>
nmap <Leader>l <C-W><C-L>
nmap <Leader>j <C-W><C-J>
nmap <Leader>k <C-W><C-K>
" Quicker scrolling throw a page
nmap <C-J> 10j
nmap <C-K> 10k
xmap <C-J> 10j
xmap <C-K> 10k
" Close current buffer without closing window
nmap <Leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" nerdtree tabs keymaps
nmap <Leader>t <plug>NERDTreeTabsToggle<CR>
nmap <Leader>f <plug>NERDTreeTabsFind<CR>
" undotree keymaps
nmap <Leader>u :UndotreeToggle<CR>
" Tab Settings
" Personal - Tabs are 4 spaces long
" set softtabstop=4 shiftwidth=4 expandtab
" Dealer Tire tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" Don't use fancy arrow chacters in NERDTree
" let g:NERDTreeDirArrows=0
 
" start tabs on open
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0

" gui settings
if has('gui_running')
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
		set backupdir=~/vimfiles/backup//
		set dir=~/vimfiles/swap//
	endif
	colorscheme wombat
else
	" airline settings
	" let g:airline_theme='ubaryd'
	let g:airline_powerline_fonts = 1
endif

" airline ctrl-space settings
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
" for some reason this allows for airline to show up even when only 1 window
" is open
set laststatus=2
