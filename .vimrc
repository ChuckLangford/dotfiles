set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'myusuf3/numbers.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'xolox/vim-misc'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

cd ~/Documents/src

" Display an 100 character column
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" Remap the leader key
let mapleader=","

" Setup Markdown syntax highlighting
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Toggle diff mode
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

function! DiffToggle()
  if &diff
    diffoff
  else
    diffthis
  endif
:endfunction

syntax enable
set list
set listchars=tab:>-
set foldcolumn=1
set foldnestmax=2
set number
set hlsearch
set background=dark
colorscheme solarized
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set lines=999 columns=999
let g:solarized_termcolors=16
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors=1
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "froala"']
" let g:syntastic_check_on_open = 1
let g:ctrlp_working_path_mode='ra'
filetype on
set scrolloff=8         " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set autoread " Reload files changed outside vim
set expandtab " This and the next three lines sets the tabs to Google code compliant
set tabstop=2
set shiftwidth=2
set softtabstop=2

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" This bit of code lets us save to vimrc and see the changes without closing, opening
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" close current buffer without closing split
nmap <silent> <leader>bd :bp\|bd #<CR>

" Numbers!
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remap arrow keys
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" remap the esc key for insert mode
:inoremap jk <esc>

" NERDTree Mappings
nmap <leader>ne :NERDTreeToggle <cr>

" Allows me to use ,ev to edit this file
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" Set tabstops for non js files
autocmd FileType html setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType scss setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
