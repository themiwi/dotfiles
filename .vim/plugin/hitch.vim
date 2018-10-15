" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set
" - some autocommands are already taking care of compressed files
if exists("loaded_hitch") || &cp || exists("#BufReadPre#*.gz")
  finish
endif
let loaded_hitch = 1

augroup hitch
  " Remove all hitch autocommands
  au!

  " Enable editing of gzipped files.
  " The functions are defined in autoload/hitch.vim.
  "
  " Set binary mode before reading the file.
  " Use "gzip -d", gunzip isn't always available.
  autocmd BufReadPre,FileReadPre	*.hitch  setlocal bin
  autocmd BufReadPost,FileReadPost	*.hitch  call whproj#read("gzip -dn")
  autocmd BufWritePost,FileWritePost	*.hitch  call whproj#write("gzip")
  autocmd FileAppendPre			*.hitch  call whproj#appre("gzip -dn")
  autocmd FileAppendPost		*.hitch  call whproj#write("gzip")
augroup END
