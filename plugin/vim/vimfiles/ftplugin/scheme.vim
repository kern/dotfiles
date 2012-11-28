function CreateSTkLoader(files)
  let temp = tempname()
  let contents = ""

  for file in a:files
    let contents .= "(load \\\"" . file . "\\\")"
  endfor

  exe ":silent ! echo \"" . contents . "\" > " . temp
  return temp
endfunction

function RunSTkFilesInInteractiveShell(files)
  execute "! rlwrap stk -no-tk -load " . CreateSTkLoader(a:files)
endfunction

nnoremap <buffer> <leader>r :w<cr>:call RunSTkFilesInInteractiveShell(["load-simply", expand("%")])<cr>
