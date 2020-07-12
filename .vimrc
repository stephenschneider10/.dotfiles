set nocompatible
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

" Syntax Plugins
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'plasticboy/vim-markdown'

" File viewer/finder
Plugin 'kien/ctrlp.vim'

" Markdown Previewer
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
" let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

" Git helper
Plugin 'tpope/vim-fugitive'

" RipGrep
Plugin 'jremmen/vim-ripgrep'

" VimWiki
Plugin 'vimwiki/vimwiki'
let g:vimwiki_list = [
       \ {
	   \	'path': '~/schneider10.github.io/wiki',
	   \	'path_html': '~/schneider10.github.io/docs',
	   \	'auto_toc': 1,
	   \    'syntax': 'markdown'}
	   \ ]

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" =================================
"       Hotkey Mappings
" =================================

" Rebind <Leader> key
let mapleader = ","

" Moving between windows in split mode
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Better tabbing - Note that in insert mode you can backtab with backspace.
set tabstop=4
set shiftwidth=4
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" leading spaces end of line graphics
set showbreak=↪\
set list listchars=trail:␣

" Redo without ctrl
nnoremap U <C-r>

" map goto definition from code completion plugin
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" =================================
"       Python IDE Setup
" =================================

" Show unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Syntax Highlighting
let python_highlight_all=1
syntax on

" Color scheme
" =================================
"       Default Settings
" =================================

set encoding=utf-8

" Better copy & paste
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2 " make backspace normal

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Showing line numbers and length
"" set nowrap  " don't automatically wrap on load
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=233

set relativenumber number  " show relative line numbers

" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Make search case insensitive
set incsearch
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
  hi Search ctermbg=DarkRed
  hi Search ctermfg=Black
endif



" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
"" set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
