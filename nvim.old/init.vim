function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/bundle')

" Vim editor plugins
Plug 'AGhost-7/critiq.vim'
Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'b4winckler/vim-angry'
Plug 'bling/vim-airline'
Plug 'brooth/far.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'github/copilot.vim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'jose-elias-alvarez/null-ls.nvim', { 'branch': 'main' }
Plug 'jose-elias-alvarez/typescript.nvim', { 'branch': 'main' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-user'
Plug 'kergoth/vim-hilinks'
Plug 'kosayoda/nvim-lightbulb'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'

" Language-specific plugins
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'fatih/vim-go'
Plug 'kern/vim-react-snippets'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'thoughtbot/vim-rspec'

" This must be imported last
Plug 'ryanoasis/vim-devicons'

call plug#end()

set shell=/opt/homebrew/bin/zsh
set number
set mouse=a
set noshowmode
set nobackup
set nowritebackup
set hidden
set noswapfile
set exrc
set lazyredraw            " (far.vim) improve scrolling performance when navigating through large results
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
colorscheme tokyonight
" if filereadable(expand("~/.vimrc_background"))
"   source ~/.vimrc_background
" endif
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
" ripgrep
nnoremap <leader>f :Rg 
nnoremap <leader>k :Rg "\b<cword>\b" <CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" NvimTree
" Leader-Leader to toggle NvimTree
nnoremap <leader><leader> :NvimTreeToggle<CR>

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

" jsx
let g:vim_jsx_pretty_highlight_close_tag = 1

" sideways
nnoremap mh :SidewaysLeft<CR>
nnoremap ml :SidewaysRight<CR>

" Coc.vim

" go-to code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
" https://github.com/neoclide/coc-snippets#examples
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require'lspconfig'.tsserver.setup {
  on_attach = on_attach,
}

require'lspconfig'.eslint.setup {
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'nvim-tree'.setup {
}

require('nvim-lightbulb').setup({
  autocmd = {
    enabled = true
  }
})

-- require("typescript").setup {
--   server = {
--     on_attach = on_attach,
--     cmd = { "typescript-language-server", "--stdio" },
--     flags = {
--       -- This will be the default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- }
EOF

" eslint language server
" autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

" Load .vimlocal
silent! so .vimlocal
