" vim-plug
call plug#begin("C:/Users/USERNAME/AppData/Local/nvim/plugged")

Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set nocompatible
set encoding=utf-8
set hidden
set autoread
set history=100
set nomodeline
set wildmenu
set ruler
set laststatus=2

set number
set scrolloff=5
set signcolumn=yes
set splitright
set splitbelow
set termguicolors
set wrap
set textwidth=0
set showcmd
set showmatch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set smartindent
set autoindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set lazyredraw
set timeoutlen=500
set updatetime=300

set nobackup
set nowritebackup
set noswapfile
set noundofile

set clipboard=unnamedplus
set mouse=n

set formatoptions-=b
set formatoptions+=c
set formatoptions-=n
set formatoptions-=o
set formatoptions+=q
set formatoptions-=r
set formatoptions-=t
set formatoptions-=v
set formatoptions+=1

syntax enable
colorscheme nord

set whichwrap+=<,>,[,]

set shell=powershell
set shellcmdflag=-command
set shellquote=\"
set shellxquote=

" remove trailing whitespace on save
autocmd BufWritePre *.ps1 :%s/\s\+$//e

" mappings
nnoremap <silent> <C-l> :nohl<CR>

" vim-airline
let g:airline_section_x = '%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}]'
let g:airline_section_y = '%y'
let g:airline_section_z = '[%l,%c]'

" nord-vim
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" nerdtree | Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" fzf (fuzzy finder) | Open with Ctrl+p
set rtp+=C:\Users\USERNAME\.fzf
nnoremap <C-p> :Files<CR>

" coc.nvim
let g:coc_global_extensions=['coc-powershell']
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()
