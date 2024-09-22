let vim_plug_installed = 0
let using_neovim = has('nvim')
let using_vim = !using_neovim

if using_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif

if empty(glob(vim_plug_path))
    if using_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    else
        silent !mkdir -p ~/.vim/autoload
        silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif
    let vim_plug_installed = 1
endif

if vim_plug_installed
    source vim_plug_path
endif

if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif

Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

if vim_plug_installed
    :PlugInstall
endif

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
set undodir=~/.vim/undo

if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

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
"set backspace=indent,eol,start

" remove trailing whitespace on save
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.ps1 :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.sh :%s/\s\+$//e

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

" vim-go
let g:go_fmt_command = "goimports"
autocmd BufWritePre *.go :CocCommand editor.action.format
"autocmd BufWritePre *.go :silent! lua vim.lsp.buf.format()

" nerdtree | Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" fzf (fuzzy finder) | Open with Ctrl+p
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>

" syntastic
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint']

" coc.nvim (:CocInstall)
let g:coc_global_extensions=['coc-go', 'coc-golines', 'coc-powershell', 'coc-python', 'coc-sh']
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()
