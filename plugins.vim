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
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'


Plug 'tpope/vim-fugitive'

Plug 'majutsushi/tagbar'

nmap <f8> :TagbarToggle<cr>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'up': '~30%' }
let g:fzf_command_prefix = 'Fzf'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap ;          :FzfBuffers<cr>
nnoremap <leader>s  :FzfFiles<cr>
nnoremap <leader>fs :FzfGitFiles<cr>
nnoremap <leader>ft :FzfTags<cr>
nnoremap <leader>fl :FzfLines<cr>
nnoremap <leader>fw :FzfWindows<cr>

Plug 'mbbill/undotree'

nnoremap <f5> :UndotreeToggle<CR>

Plug 'scrooloose/nerdtree'

nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$']


" =============================================================================
" Features
" =============================================================================

Plug 'junegunn/vim-easy-align'

vmap <enter> <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

Plug 'mattn/emmet-vim'

Plug 'Ntpeters/vim-better-whitespace'

Plug 'scrooloose/nerdcommenter'

Plug 'benekastah/neomake'

Plug 'tpope/vim-surround'

" Run Neomake on buffer write
autocmd! BufWritePost * Neomake

" =============================================================================
" Languages
" =============================================================================

Plug 'elzr/vim-json', { 'for': 'json' }

" Syntax Highlighting
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'moll/vim-node'

Plug 'mxw/vim-jsx'
" enable jsx highlighting for js files as well
let g:jsx_ext_required = 0

Plug 'avakhov/vim-yaml', { 'for': 'yaml' }

Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

Plug 'tpope/vim-haml'

Plug 'fatih/vim-go'

Plug 'rust-lang/rust.vim'

Plug 'jparise/vim-graphql'

Plug 'flowtype/vim-flow'
let g:flow#autoclose = 1

call plug#end()

