" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set
" - some autocommands are already taking care of compressed files
if exists("loaded_whproj") || &cp || exists("#BufReadPre#*.gz")
  finish
endif
let loaded_whproj = 1

augroup whproj
  " Remove all whproj autocommands
  au!

  " Enable editing of gzipped files.
  " The functions are defined in autoload/whproj.vim.
  "
  " Set binary mode before reading the file.
  " Use "gzip -d", gunzip isn't always available.
  autocmd BufReadPre,FileReadPre	*.whproj  setlocal bin
  autocmd BufReadPost,FileReadPost	*.whproj  call whproj#read("gzip -dn")
  autocmd BufWritePost,FileWritePost	*.whproj  call whproj#write("gzip")
  autocmd FileAppendPre			*.whproj  call whproj#appre("gzip -dn")
  autocmd FileAppendPost		*.whproj  call whproj#write("gzip")
augroup END
