set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" ====================
" Packages
" ====================
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'gregsexton/gitv'
Plugin 'blarghmatey/split-expander'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tmhedberg/matchit'
Plugin 'vim-scripts/tComment'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'xolox/vim-misc'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mxw/vim-jsx'
Plugin 'mileszs/ack.vim'
call vundle#end()

" ====================
" Autocommands
" ====================
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | :AirlineRefresh
augroup END

augroup config_group
  autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType html setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType css setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType scss setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

" ====================
" Leader Mappings
" ====================
let mapleader=","
nmap <silent> <leader>bd :bp\|bd #<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>ez :e ~/.vim/.zshrc<CR>
nmap <leader>ne :NERDTreeToggle <cr>
:inoremap jk <esc>
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>
set number "show line numbers
nnoremap <leader>rn :set relativenumber<CR>
nnoremap <leader>an :set norelativenumber<CR>

" ====================
" UI
" ====================
colorscheme solarized
let g:solarized_termcolors=16
set list "show whitespace
set listchars=tab:>- "show tab characters as a >-
set lines=999 columns=999 "Force vim to use the tallest/widest possible
" Display a 100 character column
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" ====================
" Syntastic
" ====================
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors=1
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "froala"']

" ====================
" Airline
" ====================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" ====================
" CTRL-P
" ====================
" let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" ====================
" JSX 
" ====================
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

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
" VIM General
" ====================
set hidden "hide a buffer when you navigate away from it
filetype plugin indent on "redo this when saving .vimrc for syntax
cd ~/Documents/src
