" Automatically activate Rainbow Parentheses.
autocmd VimEnter * RainbowParenthesesActivate

" Remove the black because I use a dark color scheme.
let g:rbpt_max = 15
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Enabled Rainbow Parentheses on the current buffer.
function! RainbowParentheses()
  autocmd Syntax <buffer> RainbowParenthesesLoadRound
  autocmd Syntax <buffer> RainbowParenthesesLoadSquare
  autocmd Syntax <buffer> RainbowParenthesesLoadBraces
  autocmd Syntax <buffer> RainbowParenthesesLoadChevrons
endfunction
