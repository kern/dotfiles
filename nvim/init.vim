function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/bundle')

" Plug 'SirVer/ultisnips'
" Plug 'unblevable/quick-scope'
Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alampros/vim-styled-jsx'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'b4winckler/vim-angry'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala'
Plug 'ervandew/supertab'
Plug 'exu/pgsql.vim'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kergoth/vim-hilinks'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'roxma/ncm-flow'
Plug 'roxma/nvim-yarp'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'thoughtbot/vim-rspec'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'uarun/vim-protobuf'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'w0rp/ale'
Plug 'wavded/vim-stylus'

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
let base16colorspace=256
colorscheme base16-tomorrow
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
" autocmd VimEnter * AirlineTheme base16

" folding and indent
set foldenable
set foldmethod=indent
set foldnestmax=2
set foldminlines=3
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

" Leader-Leader to flip to the previous buffer.
nnoremap <leader><leader> <c-^>

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

" fzf
nnoremap <Space> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>t :Tags<CR>
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
nnoremap <Leader>f :Rg 
nnoremap <Leader>k :Rg "\b<cword>\b" <CR>

" NERDTree
nnoremap <Leader><Leader> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
nnoremap <Leader>j :!tmux send-keys -t 0:0.1 C-p C-j <CR><CR>

" vim-airline
let g:airline_powerline_fonts = 1

" jsx
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

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

" Leader-O to open the current directory in a Finder window
nnoremap <leader>o :exe "!open ".expand('%:h').'/'<cr><cr>

" postgres
let g:sql_type_default = 'pgsql'

" LanguageClient-neovim
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsList = "quickfix"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': [system('PATH=$(npm bin):$PATH && which flow-language-server | tr -d "\n"'), '--stdio'],
    \ 'javascript.jsx': [system('PATH=$(npm bin):$PATH && which flow-language-server | tr -d "\n"'), '--stdio'],
    \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Quickfix and Locations
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
nnoremap <Leader>c :call OpenQuickfix()<CR>
nnoremap <Leader>l :call OpenLocations()<CR>

" ALE
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
highlight ALEWarning ctermbg=DarkRed
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tslint'],
    \ 'ruby': ['rubocop'],
    \ 'graphql': ['prettier'],
    \ }
nnoremap <Leader>e :ALENextWrap <CR>
nnoremap <Leader>w :ALEPreviousWrap <CR>

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" load .vimlocal
silent! so .vimlocal

" ripgrep
set grepprg=rg\ --vimgrep

" Goyo
nnoremap <Leader>g :Goyo <CR>

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" vim-go
let g:go_fmt_command = "goimports"
autocmd BufEnter *.go nnoremap <Leader>tf :GoTest<CR>
autocmd BufEnter *.go nnoremap <Leader>tt :GoTestFunc<CR>

" Reopen folds for go files on save
autocmd BufWritePost *.go normal! zv

" RSpec.vim
let g:rspec_command = "!bundle exec rspec --fail-fast {spec}"
autocmd BufEnter *.rb nnoremap <Leader>tf :call RunCurrentSpecFile()<CR>
autocmd BufEnter *.rb nnoremap <Leader>tt :call RunNearestSpec()<CR>
autocmd BufEnter *.rb nnoremap <Leader>tl :call RunLastSpec()<CR>
autocmd BufEnter *.rb nnoremap <Leader>ta :call RunAllSpecs()<CR>
