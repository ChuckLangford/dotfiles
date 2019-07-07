" ====================
" Packages
" ====================
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'Lokaltog/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'fatih/vim-go'
Plug 'ekalinin/Dockerfile.vim'
call plug#end()

" ====================
" Leader Mappings
" ====================
let mapleader=" "
nmap <silent> <leader>bd :bp\|bd #<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>ez :e ~/.vim/.zshrc<CR>
nmap <silent> <leader>fj :%!python -m json.tool<CR>
nnoremap <leader>rn :set relativenumber!<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>ff :Files<CR>

" ====================
" VIM General
" ====================
:inoremap jk <esc>
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>
set number "show line numbers
set relativenumber "show relative numbers
set hidden "hide a buffer when you navigate away from it
filetype plugin indent on "redo this when saving .vimrc for syntax
filetype plugin on "this is for the csv plugin
set undofile "maintain undo history between sessions
set undodir=~/.vim/undodir
cd ~/Documents/src

" ====================
" UI
" ====================
" The order of these lines is IMPORTANT
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set background=dark
colorscheme NeoSolarized
set termguicolors
let python_highlight_all=1
set list "show whitespace
if exists('+colorcolumn')
  set colorcolumn=120
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
endif

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=Red guibg=Red
" Display tabs at the beginning of a line in Python and JS files as bad.
au BufRead,BufNewFile *.js,*.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.* match BadWhitespace /\s\+$/

" ====================
" Searching
" ====================
set hlsearch "Highlight all the found search patterns
let g:ackprg = 'ag --nogroup --nocolor --column --hidden'

" ====================
" Folding
" ====================
set foldmethod=syntax

" ====================
" Quick Fix List
" ====================
nmap <silent> ]q :cn<CR>
nmap <silent> [q :cp<CR>

" ====================
" Autocommands
" ====================
augroup config_group
  autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType html setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType css setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType scss setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd Filetype crontab setlocal nobackup nowritebackup
  au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

" ====================
" JSX
" ====================
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" ====================
" Go
" ====================
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
