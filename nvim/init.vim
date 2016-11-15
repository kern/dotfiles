function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/bundle')

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'SirVer/ultisnips'
Plug 'b4winckler/vim-angry'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala'
Plug 'ervandew/supertab'
Plug 'exu/pgsql.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kergoth/vim-hilinks'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'uarun/vim-protobuf'
Plug 'vim-airline/vim-airline-themes'
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
set scrolloff=3
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

" Identation
set autoindent
set copyindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2

" colors
filetype plugin indent on
syntax enable
set background=dark
set cursorline
set t_Co=256
let base16colorspace=256
colorscheme base16-tomorrow
autocmd VimEnter * AirlineTheme base16

" indent guides
autocmd VimEnter * IndentGuidesEnable
hi IndentGuidesOdd ctermbg=18
hi IndentGuidesEven ctermbg=19

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

" K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" CtrlP
let g:ctrlp_map = '<Space>'

" The Silver Searcher (ag) 
" Thanks ThoughtBot: https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor 

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" NERDTree
nnoremap <C-Space> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" Highlight the current line number.
function! <SID>SetCursorLine()
  hi clear CursorLine
  hi CursorLineNR ctermfg=white guifg=white
endfunction
call <SID>SetCursorLine()
augroup _CursorLine
  au!
  au! ColorScheme * :call <SID>SetCursorLine()
augroup END

" Leader-H to find syntax highlighting groups under cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" postgres
let g:sql_type_default = 'pgsql'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr> <C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr> <BS> deoplete#smart_close_popup()."\<C-h>"
