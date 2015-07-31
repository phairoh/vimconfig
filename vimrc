" Install Pathogen
" mkdir autoload bundle
" curl -LSso autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
" Rrun the following in bundle
" git clone http://github.com/junegunn/vim-easy-align
" git clone http://github.com/xolox/vim-misc
" git clone http://github.com/xolox/vim-session
" git clone http://github.com/scrooloose/nerdtree
" git clone http://github.com/scrooloose/nerdcommenter
" git clone http://github.com/jistr/vim-nerdtree-tabs
" git clone http://github.com/tpope/vim-fugitive
" git clone http://github.com/Shougo/unite.vim
" git clone http://github.com/bling/vim-airline
" git clone http://github.com/mbbill/undotree
" git clone http://github.com/mattn/emmet-vim
" git clone http://github.com/Ntpeters/vim-better-whitespace

" https://github.com/junegunn/vim-easy-align

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
" Re-highlight section after indent
vnoremap > >gv
vnoremap < <gv
" Quickly edit and load vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" NERDtree tabs keymaps
nmap <leader>t <plug>NERDTreeTabsToggle<CR>
nmap <leader>f <plug>NERDTreeTabsFind<CR>
" easy-align keymaps
vmap <enter> <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)
" Unite keymaps
nnoremap <leader>uu :<c-u>Unite -buffer-name=menu<cr>
nnoremap <leader>uf :<c-u>Unite -buffer-name=files file<cr>
nnoremap <leader>uy :<c-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <leader>ub :<c-u>Unite -buffer-name=buffers buffer<cr>
" Unite settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_history_yank_enable = 1
" Undotree keymaps
nnoremap <f5> :UndotreeToggle<CR>
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
		" Unite settings
		let g:unite_data_directory = '~/vimfiles/unite'
	endif
	colorscheme wombat
else
	let g:nerdtree_tabs_open_on_console_startup = 0
	" set backup and swap directories - non gui so i'm probably on osx/linux
	set backupdir=~/.vim/tmp/backup//
	set dir=~/.vim/tmp/swap//
	" Unite settings
	let g:unite_data_directory = '~/.vim/unite'
	" airline settings
	let g:airline_powerline_fonts = 1
	colorscheme wombat256
endif

" airline settings
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
" for some reason this allows for airline to show up even when only 1 window
" is open
set laststatus=2
