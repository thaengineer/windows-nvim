" General settings
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set hidden
set wildmenu
set showcmd
set showmatch
set autoread
set history=1000
set nomodeline
autocmd BufWritePre * :%s/\s\+$//e

" Interface enhancements
set number
set scrolloff=8
set signcolumn=yes
set splitright
set splitbelow
set termguicolors
set wrap
set formatoptions=qrn1
set formatoptions-=cro
set scrolloff=4
set whichwrap+=<,>,[,]

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Tabs and Indentation
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set autoindent

" Clipboard
set clipboard=unnamedplus
set mouse=n

" Performance
set lazyredraw
set timeoutlen=500

" Undo and backups
set nobackup
set nowritebackup
set noswapfile
set noundofile
set updatetime=300

" vim-plug:
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }       " catppuccin theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'                             " fzf vim integration
Plug 'preservim/nerdtree'                           " file explorer
Plug 'vim-airline/vim-airline'                      " status bar
Plug 'tpope/vim-fugitive'                           " git integration
Plug 'scrooloose/syntastic'                         " Syntax checking
Plug 'sheerun/vim-polyglot'                         " syntax highlighting
Plug 'ycm-core/YouCompleteMe'                       " autocompletion framework

call plug#end()

" Status line
set laststatus=2
set ruler
let g:airline_section_x = '%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}]'
let g:airline_section_y = '%y'
let g:airline_section_z = '[%l,%c]'

" Colorscheme
syntax enable
let g:catppuccin_flavour =
colorscheme catppuccin_mocha

" nerdtree | Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" fzf (fuzzy finder) | Open with Ctrl+p
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>

" syntastic
let g:syntastic_powershell_checkers = ['psscriptanalyzer']
let g:syntastic_powershell_exe = 'powershell'

" YouCompleteMe
let g:ycm_filetype_blacklist = {}
let g:ycm_min_num_of_chars_for_completion = 2
autocmd FileType ps1 setlocal omnifunc=ycm#complete
