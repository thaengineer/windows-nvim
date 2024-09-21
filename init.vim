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
set formatoptions-=cro
set formatoptions=qrn1
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

set shell=powershell
set shellcmdflag=-command
set shellquote=\"
set shellxquote=

" vim-plug (:PlugInstall)
call plug#begin('C:/Users/USERNAME/AppData/Local/nvim/plugged')

Plug 'catppuccin/vim', { 'as': 'catppuccin' }       " Catppuccin theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'                             " Fzf Vim integration
Plug 'preservim/nerdtree'                           " File explorer
Plug 'vim-airline/vim-airline'                      " Status bar
Plug 'tpope/vim-fugitive'                           " Git integration
Plug 'scrooloose/syntastic'                         " Syntax checking
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Autocompletion framework

call plug#end()

" Status line
set laststatus=2
set ruler
let g:airline_section_x = '%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}]'
let g:airline_section_y = '%y'
let g:airline_section_z = '[%l,%c]'

" Colorscheme
syntax enable
let g:catppuccin_flavour = "mocha"
colorscheme catppuccin_mocha

" nerdtree | Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" fzf (fuzzy finder) | Open with Ctrl+p
set rtp+=C:\Users\USERNAME\.fzf " Add fzf to runtime path
nnoremap <C-p> :Files<CR>

" coc.nvim (:CocInstall coc-powershell coc-sql coc-xml)
let g:coc_global_extensions=['coc-powershell', 'coc-sql', 'coc-xml']
noremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
noremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
noremap <silent><expr> <C-Space> coc#refresh()
