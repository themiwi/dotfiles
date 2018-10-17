call pathogen#infect()
call pathogen#helptags()
set encoding=utf-8

colorscheme delek

" override highlighting of special characters
"au ColorScheme * hi Special cterm=NONE ctermfg=Red gui=NONE guifg=deeppink

filetype plugin indent on
filetype on " enable filetype detection

set nocompatible  " Use Vim defaults (much better!)
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set nohlsearch
set textwidth=0   " do not want lines to auto-wrap
syntax on
"set diffopt+=iwhite
set nobackup writebackup " backup current file, deleted afterwards (default)
set viminfo='1000,\"10000 " 1000 files with marks, 10000 lines of registers
set history=1000   " keep 1000 lines of command line history
set ruler   " show the cursor position all the time
set number  " want to see line numbering
set tabpagemax=20
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set nojoinspaces
" Don't try to be smart with octal and hex numbers, I hardly ever increment or
" decrement them anyways and it's a pain with floating point numbers, e.g.
" 1e+04.
set nrformats=

" set colors
set t_Co=256

set autowrite

" use hjkl in insert mode as well (with ctrl)
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>

set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

set modeline
set modelines=5

"" persistent undo
"set undodir=~/.vim/undodir
"set undofile
"set undolevels=1000
"set undoreload=100000

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list! number!<CR>
set list

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:¿\ ,eol:¬,trail:~,extends:>,precedes:<,space:·

" highlight trailing space as error and tabs in general
"highlight NonText ctermfg=Cyan
"highlight SpecialKey ctermfg=Cyan
"highlight TabCharacters ctermbg=LightGray guibg=LightGray
"highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd Syntax * syn match TabCharacters "\t" containedin=ALL
"autocmd Syntax * syn match ExtraWhitespace excludenl "\s\+$" containedin=ALL
" highlight anything beyond column 80
"highlight OverLength ctermbg=lightred ctermfg=black guibg=#592929
if exists('+colorcolumn')
   set colorcolumn=80
endif

" C++ completion
set tags+=~/.vim/tags/cpp

" build tags of your own project with CTRL+F12

map <C-F12> :!ctags-exuberant -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" taglist plugin
let Tlist_Ctags_Cmd = "ctags-exuberant"
nnoremap <silent> <F7> :TlistToggle<CR>

" W command to delete trailing white space and Dos-returns and to expand tabs
" to spaces.
" RetabIndent seems to be broken for me when wanting the "tabs-to-indent,
" spaces-to-align" style. See
" http://vim.wikia.com/wiki/Talk:Indent_with_tabs,_align_with_spaces
"nnoremap W :%s/[\r \t]\+$//e<CR>:RetabIndent!<CR>

" Preserve no EOL at EOF
:let g:PreserveNoEOL=1

" Language: fortran indenting
let fortran_do_enddo=1
let fortran_free_source=0
autocmd BufRead *.[fF]03 set filetype=fortran
autocmd FileType fortran set noexpandtab
autocmd FileType fortran set tabstop=4 shiftwidth=4 softtabstop=4

" Language: C/C++ indenting (would like FileType c,cpp, but that kills OpenFOAM below)
autocmd BufRead *.[ch],*.[ch][px][px],*.cc,*.hh set noexpandtab shiftwidth=4 preserveindent
autocmd BufRead *.[ch],*.[ch][px][px],*.cc,*.hh set copyindent softtabstop=0 tabstop=4 autoindent smarttab
autocmd BufRead *.[ch],*.[ch][px][px],*.cc,*.hh set cindent cinoptions=(0,g0,W2s,u0,U0,N-s,U1,i-s

" Language: Vala
autocmd FileType vala set preserveindent copyindent autoindent smarttab
autocmd FileType vala set tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType vala set cindent cinoptions=(0,W2s,u0,U0

" Language: Python
autocmd FileType python set cinoptions= nocindent shiftwidth=2 expandtab

" Language: OpenFOAM/FreeFOAM
autocmd BufRead *.[CH] set expandtab shiftwidth=4 filetype=cpp
autocmd BufRead *.[CH] set cindent cinoptions=+s-2,(s,U1,is,g0,Ws,l1,t0 cinkeys=0{,0},0),:,!^F,o,O,e

" Language: QBS
autocmd BufRead *.qbs set filetype=javascript

" Language: XAML
autocmd BufRead *.xaml set filetype=xml tabstop=4 shiftwidth=4 softtabstop=4

" Language: MSBuild
autocmd BufRead *.[tT]argets,*.[tT]asks,*.csproj set filetype=xml tabstop=4 shiftwidth=4 softtabstop=4

" Language: Asymptote
au BufNewFile,BufRead *.asy    setfiletype asy

au BufNewFile,BufRead *.adoc    setfiletype asciidoc

au BufReadCmd *.nupkg call zip#Browse(expand("<amatch>"))
au BufReadCmd *.pptx call zip#Browse(expand("<amatch>"))
au BufReadCmd *.vsd call zip#Browse(expand("<amatch>"))

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

"" SuperTab option for context aware completion
"let g:SuperTabDefaultCompletionType="context"
"
"" Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto=0
"" Show clang errors in the quickfix window
"let g:clang_complete_copen=1
"
"" Use libclang
"let g:clang_use_library=1

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" Fix for a fugitive/Minibufexpl incompatibility:
" https://github.com/tpope/vim-fugitive/issues/91
autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete

syntax enable
set background=dark
"set background=light
"let g:solarized_visibility="low"
"let g:solarized_visibility="high"
"colorscheme solarized
colorscheme gruvbox
set listchars=tab:\ ,eol:¬,trail:~,extends:>,precedes:<,space:·

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let g:GPGExecutable = '/usr/bin/gpg2'

highlight NonText ctermfg=237
highlight SpecialKey ctermfg=237
