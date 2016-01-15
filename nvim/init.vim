call plug#begin('~/.config/nvim/bundle')

Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala'
Plug 'jiangmiao/auto-pairs'
Plug 'kergoth/vim-hilinks'
Plug 'kern/vim-es7'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'rust-lang/rust.vim'
Plug 'w0ng/vim-hybrid'
Plug 'wavded/vim-stylus'

call plug#end()

set shell=/usr/local/bin/zsh
set number
set mouse=a
set noshowmode
set nobackup
set nowritebackup
set noswapfile
set exrc
set secure
set backspace=indent,eol,start

" Windows
set winwidth=20
set winminwidth=20
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Search
set hlsearch
set smartcase
set ignorecase

" Colors
filetype plugin indent on
syntax enable
let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid

" jk is the new escape.
inoremap jk <esc>

" Use comma as the leader key.
let mapleader=','
let maplocalleader='\'

" Swap semicolon and colon.
nnoremap ; :
nnoremap : ;

" Navigate wrapped lines better.
nnoremap j gj
nnoremap k gk

" Disable the arrow keys.
inoremap <esc> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" %% to write the current directory in commands.
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" Leader-S to sort the selected lines.
vnoremap <leader>s :sort<cr>

" CtrlP
let g:ctrlp_map = '<Space>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git'

" Identation
set autoindent
set copyindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2

" tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" vim-airline
let g:airline_powerline_fonts = 1

" jsx
let g:jsx_ext_required = 0
