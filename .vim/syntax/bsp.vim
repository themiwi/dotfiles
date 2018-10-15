syn keyword celTodo contained TODO FIXME XXX NOTE
"syn match bspComment "^C " contains=celTodo
"syn keyword bspConditional IF ENDIF DO ENDDO

syn keyword bspFileCommands ADD LOAD WRITE WFOPEN WFCLOS RTAB
syn keyword bspCommands ARC BSW UVXYZ SORT DEL ECHO SET EDIT TRASYS COPY TRAFOR APPROX TEXT DEF TYPE SPIEG ABST LOFT SYM EXTRA TRANS ROT AGL ENLARGE READSTL PLFILT PMPUR PLOTVM PMUN END
syn keyword bspRepeat DO ENDDO REPEAT
syn keyword bspConditional IF ENDIF ELSE
syn keyword bspRedCommands UGEXPO PLOTPM UGDEL PLD
syn keyword bspGreenCommands OINK 

syn match bspConditional /C=/
syn match bspComment "^C\s.*"
syn match bspComment "\tC\s.*"
syn match bspComment /\!\s.*$/

syn match bspDeclaration /:.*:.*=.*\t/
syn match bspVariable /:\w*=/he=e-1,hs=s+1
syn match bspVariable /:\w*/hs=s+1
syn match bspFunction /\#\w*(/he=e-1
"syn match bspDeclaration /:.*:.*=.*/
syn match bspVarType /:[A-Z]{1}:/

syn region bspString start='"' end='"'
syn region bspString start="'" end="'"
syn keyword bspStatement ESTA EEND

" Regular int like number with - + or nothing in front
syn match bspNumber  "\<\d\+\>"
syn match bspNumber  "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\="
syn match bspNumber  "\<\d\+[eE][-+]\=\d\+\>"
syn match bspNumber  "\<\d\+\([eE][-+]\=\d\+\)\=\>"



hi def link bspStatement	Statement
hi def link bspRepeat		Repeat
hi def link bspConditional	Conditional
hi def link bspRedCommands     	Include
hi def link bspFunction     	Function
hi def link bspString     	String
hi def link bspVariable     	Type
hi def link bspVariableAlone   	Type
hi def link bspGreenCommands   	Type
hi def link bspVarType     	Type
hi def link bspDeclaration     	Identifier
hi def link bspConditional    	Structure
hi def link bspFileCommands	Statement
hi def link bspCommands		Statement
hi def link bspComment     	Comment
hi def link bspNumber		Number

"----------------------------------------------------------------
" Celestia Star Catalog Numbers
"----------------------------------------------------------------

"syn region celString start='"' end='"' contained
"
"syn match celHip '\d\{1,6}' nextgroup=celString
"syn region celDescBlock start="{" end="}" fold transparent contains=ALLBUT,celHip,celDesc
"
"syn keyword celBlockCmd RA Dec Distance AbsMag nextgroup=celNumber
"syn keyword celBlockCmd SpectralType nextgroup=celString

let b:current_syntax = "bsp"

"hi def link celTodo        Todo
"hi def link celBlockCmd    Statement
"hi def link celHip         Type
"hi def link celString      Constant
"hi def link celNumber      Constant

