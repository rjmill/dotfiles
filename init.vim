"" Plugins
call plug#begin('~/.vim/plugged') " TODO: Give this the proper neovim path

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'flazz/vim-colorschemes'

Plug 'SirVer/ultisnips'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe'

"" ctags
"Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

"" git
Plug 'tpope/vim-fugitive'

"" HTML5
Plug 'othree/html5.vim'

"" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'jason0x43/vim-js-indent'

"" React
Plug 'mxw/vim-jsx'

"" Handlebars
Plug 'mustache/vim-mustache-handlebars'

"" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"" PlantUML
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }

"" Rust
Plug 'wting/rust.vim'

"" Elixir
Plug 'elixir-lang/vim-elixir'

" install these when you know you'll actually use them
" Plug 'scrooloose/syntastic'
" Plug 'tpope/vim-projectionist'

call plug#end()

filetype on
syntax on
let mapleader = "\<space>"

"" Tab Settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent

"" Backup Settings
set nobackup
set nowritebackup
set noswapfile

"" Movement Settings
set relativenumber
set mouse=c

"" Search Settings
set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault

noremap <leader>, :noh<cr>:call clearmatches()<cr>
" search and replace word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

nnoremap <leader>k :grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

"" Window Settings
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l

inoremap <m-h> <esc><c-w>h
inoremap <m-j> <esc><c-w>j
inoremap <m-k> <esc><c-w>k
inoremap <m-l> <esc><c-w>l

tnoremap <m-h> <c-\><c-n><c-w>h
tnoremap <m-j> <c-\><c-n><c-w>j
tnoremap <m-k> <c-\><c-n><c-w>k
tnoremap <m-l> <c-\><c-n><c-w>l

nnoremap <leader>v <c-w>v
nnoremap <leader>s <c-w>s

nnoremap <leader>+ 10<c-w>+
nnoremap <leader>- 10<c-w>-

"" Tab Settings
nnoremap <m-i> gt
nnoremap <m-b> gT

inoremap <m-i> <esc>gt
inoremap <m-b> <esc>gT

tnoremap <m-i> <c-\><c-n>gt
tnoremap <m-b> <c-\><c-n>gT

"" Tab
nnoremap <m-t> :tabe term://.//zsh<cr>

nnoremap <m-1> 1gt
nnoremap <m-2> 2gt
nnoremap <m-3> 3gt
nnoremap <m-4> 4gt
nnoremap <m-5> 5gt
nnoremap <m-6> 6gt
nnoremap <m-7> 7gt
nnoremap <m-8> 8gt
nnoremap <m-9> 9gt

tnoremap <m-1> <c-\><c-n>1gt
tnoremap <m-2> <c-\><c-n>2gt
tnoremap <m-3> <c-\><c-n>3gt
tnoremap <m-4> <c-\><c-n>4gt
tnoremap <m-5> <c-\><c-n>5gt
tnoremap <m-6> <c-\><c-n>6gt
tnoremap <m-7> <c-\><c-n>7gt
tnoremap <m-8> <c-\><c-n>8gt
tnoremap <m-9> <c-\><c-n>9gt

"" Mode Switch Settings
nnoremap ; :
inoremap jf <esc>
inoremap jk <esc>
inoremap kj <esc>

tnoremap <c-\> <c-\><c-n>
" in case I forget that this doesn't escape in non-terminal buffers
inoremap <c-\> <nop>
nnoremap <c-\> <nop>

"" Folding
nnoremap <leader>z za
autocmd FileType text setlocal foldmethod=indent
autocmd FileType markdown setlocal foldmethod=indent

"" Shortcuts (unabashed laziness)
nnoremap <c-l> ;
nnoremap <leader>w :w<cr>
nnoremap <leader>e :e ~/
nnoremap <F5> :make<cr>

" paste and yank from clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y

vnoremap <leader>p "+p
vnoremap <leader>y "+y


"" Buffer stuff
set hidden " to keep terminal buffers open in background
nnoremap <leader><leader> <c-^>

"" Registers and Macros
nnoremap Q @q

"" Tags
nnoremap <F8> :TagbarToggle<cr>
set tags=./tags;

"" Display
set background=dark
colorscheme molokai
highlight ColorColumn ctermbg=237

set showmatch
set scrolloff=2

let &colorcolumn="81,".join(range(121,999),",")

set textwidth=80

"" NERDTree
map <leader>m :NERDTreeToggle<cr>

"" UltiSnips
nnoremap <leader>u :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit = "vertical"

let g:UltiSnipsExpandTrigger = "<c-f>"

"" YouCompleteMe
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"" Fugitive
" Don't keep fugitive buffers open after hiding them
au bufReadPost fugitive://* set bufhidden=delete
