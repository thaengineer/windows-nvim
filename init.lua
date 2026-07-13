-- ==================== vim-plug Auto-Install & Setup (Windows friendly) ====================
local config_dir = vim.fn.stdpath("config")                    -- Usually C:\Users\YourName\AppData\Local\nvim
local vim_plug_path = config_dir .. "/autoload/plug.vim"
local vim_plug_installed = false

if vim.fn.empty(vim.fn.glob(vim_plug_path)) == 1 then
  vim_plug_installed = true
  vim.fn.mkdir(config_dir .. "/autoload", "p")
  vim.fn.system({
    "curl",
    "-fLo",
    vim_plug_path,
    "--create-dirs",
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
  })
end

-- Load vim-plug
vim.cmd("source " .. vim_plug_path)

-- Plugins
local plug_path = config_dir .. "/plugged"
vim.call("plug#begin", plug_path)

vim.cmd([[
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/syntastic'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
]])

vim.call("plug#end")

if vim_plug_installed then
  vim.cmd("PlugInstall")
end

-- ==================== General Settings ====================
vim.opt.compatible = false
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.autoread = true
vim.opt.history = 1000
vim.opt.modeline = false

-- Trim trailing whitespace on save (only for PowerShell files + safe check)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ps1", "*.psm1", "*.psd1", "*.ps1xml", "*.ps1cmd" },
  callback = function()
    if vim.bo.modifiable and not vim.bo.readonly then
      vim.cmd([[ %s/\s\+$//e ]])
    end
  end,
})

-- Interface
vim.opt.number = true
vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.formatoptions:remove("cro")
vim.opt.formatoptions:append("qrn1")
vim.opt.whichwrap:append("<,>,[,]")

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Tabs and Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Clipboard & Mouse
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "n"

-- Performance
vim.opt.lazyredraw = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 300

-- Undo and backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Windows-friendly undo directory
local undodir = config_dir .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- Shell (PowerShell) - Best settings for Windows 11
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy Bypass -Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

-- Status line
vim.opt.laststatus = 2
vim.opt.ruler = true

-- ==================== Colorscheme ====================
vim.cmd("syntax enable")
vim.g.catppuccin_flavour = "mocha"
vim.cmd("colorscheme catppuccin_mocha")

-- ==================== Keymappings ====================
vim.keymap.set("n", "<C-l>", ":nohl<CR>", { silent = true, noremap = true })

-- NERDTree
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

-- fzf (Windows-friendly path)
vim.opt.rtp:append(vim.fn.expand("~/scoop/apps/fzf/current") or vim.fn.expand("~/.fzf"))
vim.keymap.set("n", "<C-p>", ":Files<CR>", { noremap = true, silent = true })

-- ==================== Plugin Settings ====================
-- vim-airline
vim.g.airline_section_x = "%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}]"
vim.g.airline_section_y = "%y"
vim.g.airline_section_z = "[%l,%c]"

-- coc.nvim
vim.g.coc_global_extensions = { "coc-powershell" }

-- Completion (Insert mode)
vim.keymap.set("i", "<Tab>", function()
  return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#confirm"]() or "<Tab>"
end, { expr = true, silent = true })

vim.keymap.set("i", "<CR>", function()
  return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#confirm"]() or "<CR>"
end, { expr = true, silent = true })

vim.keymap.set("i", "<C-Space>", "<Cmd>call coc#refresh()<CR>", { silent = true })
