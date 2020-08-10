function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/bundle')

" Vim editor plugins
Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'b4winckler/vim-angry'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kergoth/vim-hilinks'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'

" Language-specific plugins
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'thoughtbot/vim-rspec'
Plug 'lervag/vimtex'

" This must be imported last
Plug 'ryanoasis/vim-devicons'

call plug#end()

set shell=/usr/local/bin/zsh
set number
set mouse=a
set noshowmode
set nobackup
set nowritebackup
set hidden
set noswapfile
set exrc
set secure
set scrolloff=3
set re=0
set backspace=indent,eol,start

" Windows
set winwidth=20
set winminwidth=20
set winwidth=84
set winheight=5
set winminheight=5
set winheight=10

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

" Colors
filetype plugin indent on
syntax enable
set background=dark
set cursorline
let base16colorspace=256
colorscheme base16-tomorrow
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
" autocmd VimEnter * AirlineTheme base16

" Folding and indentation
set foldenable
set foldmethod=indent
set foldnestmax=2
set foldminlines=3
autocmd VimEnter * IndentGuidesEnable
hi IndentGuidesOdd ctermbg=18
hi IndentGuidesEven ctermbg=19

" Highlight the current line number
function! <SID>SetCursorLine()
  hi clear CursorLine
  hi CursorLineNR ctermfg=white guifg=white
endfunction
call <SID>SetCursorLine()
augroup _CursorLine
  au!
  au! ColorScheme * :call <SID>SetCursorLine()
augroup END

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

" Leader-R to rename the current file.
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <leader>r :call RenameFile()<cr>

" Leader-F to clean the current file of fancy characters.
function! RemoveFancyCharacters()
  let typo = {}
  let typo["“"] = '"'
  let typo["”"] = '"'
  let typo["‘"] = "'"
  let typo["’"] = "'"
  let typo["–"] = '--'
  let typo["—"] = '---'
  let typo["…"] = '...'
  :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
nnoremap <leader>f :call RemoveFancyCharacters()<cr>

" Leader-S to sort the selected lines.
vnoremap <leader>s :sort<cr>

" Leader-H to find syntax highlighting groups under cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Leader-O to open the current directory in a Finder window
nnoremap <leader>o :exe "!open ".expand('%:h').'/'<cr><cr>

" Leader-C for Quickfix
" Leader-L for Locations
function! OpenQuickfix()
  if !empty(getqflist())
    copen 2
  endif
endfunction
function! OpenLocations()
  if !empty(getloclist(0))
    copen 2
  endif
endfunction
nnoremap <leader>c :call OpenQuickfix()<CR>
nnoremap <leader>l :call OpenLocations()<CR>

" fzf
" Space opens fzf on filenames
" Leader-b opens fzf on open buffers
" Leader-t opens fzf on tags
nnoremap <space> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
nnoremap <leader>f :Rg 
nnoremap <leader>k :Rg "\b<cword>\b" <CR>
" ripgrep
set grepprg=rg\ --vimgrep

" NERDTree
" Leader-Leader to toggle NERDTree
nnoremap <leader><leader> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tmux integration
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
nnoremap <Leader>j :!tmux send-keys -t 0:0.1 C-p C-j <CR><CR>

" Airline
let g:airline_powerline_fonts = 1

" Goyo
" Leader-g to enable Goyo (distraction-free writing mode)
nnoremap <Leader>g :Goyo <CR>

" Supertab
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Golang
let g:go_fmt_command = "goimports"
autocmd BufEnter *.go nnoremap <Leader>tf :GoTest<CR>
autocmd BufEnter *.go nnoremap <Leader>tt :GoTestFunc<CR>
" Reopen folds for go files on save
autocmd BufWritePost *.go normal! zv

" PostgreSQL
let g:sql_type_default = 'pgsql'

" Ruby & RSpec
let g:rspec_command = "!bundle exec rspec --fail-fast {spec}"
autocmd BufEnter *.rb nnoremap <Leader>tf :call RunCurrentSpecFile()<CR>
autocmd BufEnter *.rb nnoremap <Leader>tt :call RunNearestSpec()<CR>
autocmd BufEnter *.rb nnoremap <Leader>tl :call RunLastSpec()<CR>
autocmd BufEnter *.rb nnoremap <Leader>ta :call RunAllSpecs()<CR>

" LaTeX
let g:tex_flavor = 'latex'

" Load .vimlocal
silent! so .vimlocal
