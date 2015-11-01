" vim Plugins setup
" Uses vim-plug (https://github.com/junegunn/vim-plug)

scriptencoding utf-8

" =============================================================================
" Plugin Manager Setup
" =============================================================================
"
" Install the plugin manager if it doesn't exist
let s:plugins=$VIMDATA . '/bundle'
let s:plugin_manager=$VIMHOME . '/autoload/plug.vim'
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:plugin_manager))
	echom 'vim-plug not found. Installing...'
	if executable('curl')
		silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' . s:plugin_url
	elseif executable('wget')
		call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
		silent exec '!wget --force-directories --no-check-certificate -0 ' . expand(s:plugin_manager) . ' ' . s:plugin_url
	else
		echom 'Could not download plugin manager. No plugins were installed.'
		finish
	endif
	augroup vimplug
		autocmd!
		autocmd VimEnter * PlugInstall
	augroup END
endif

" Create a horizontal split at the bottom when installing plugins
let g:plug_window = 'botright new'

" Additional operating system detection
let s:has_mac = 0
let s:has_arch = 0
if has('unix')
  let s:uname = system('uname -s')
  if s:uname =~? 'Darwin'
    let s:has_mac = 1
  else
    let s:issue = system('cat /etc/issue')
    if s:issue =~? 'Arch Linux'
      let s:has_arch = 1
    elseif s:issue =~? 'Oracle Linux'
      let s:has_oracle = 1
    endif
  endif
endif

call plug#begin(s:plugins)

" =============================================================================
" Interface
" =============================================================================
"
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'

" Open buffer list with ;
nnoremap ; :CtrlPBuffer<cr>
" Open CtrlP fuzzy finder with <leader>s
let g:ctrlp_map = '<leader>s'
" Move CtrlP window to top
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
	\'dir': '\v[\/](node_modules|\.svn)$'
	\}
" Close currently selected buffer in CtrlP
let g:ctrlp_buffer_func = {'enter': 'MyCtrlPMappings' }
func! MyCtrlPMappings()
	nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
	let line = getline('.')
	let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
				\ : fnamemodify(line[2:], ':p')
	exec "bd" bufid
	exec "norm \<F5>"
endfunc

Plug 'mbbill/undotree'

nnoremap <f5> :UndotreeToggle<CR>

Plug 'scrooloose/nerdtree'

nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>


" =============================================================================
" Features
" =============================================================================

Plug 'junegunn/vim-easy-align'

vmap <enter> <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

Plug 'mattn/emmet-vim'

Plug 'Ntpeters/vim-better-whitespace'

Plug 'scrooloose/nerdcommenter'

" =============================================================================
" Languages
" =============================================================================

" JavaScript omnicompletion
if executable('npm')
  Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
endif

Plug 'elzr/vim-json', { 'for': 'json' }

" Syntax Highlighting
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'mxw/vim-jsx'

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'avakhov/vim-yaml', { 'for': 'yaml' }

Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

Plug 'groenewege/vim-less', { 'for': 'less' }

Plug 'wting/rust.vim', { 'for': 'rust' }

" Filetype plugin for Scala and SBT
Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'sbt.scala'] }
Plug 'derekwyatt/vim-sbt', { 'for': 'sbt.scala' }

call plug#end()

