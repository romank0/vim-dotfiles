" Vim compiler file
" Compiler:	Pyright for Python
" Maintainer: Roman Konoval <rkonoval@gmail.com>

if exists("current_compiler")
  finish
endif
let current_compiler = "pyright"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=just\ pyright\ %:p
"CompilerSet errorformat=%E\ \ %f:%l:%c\ -\ %t%.%#:\ %m,%C\ \ %\%+%.%#,%Z%.%#
CompilerSet errorformat=\ \ %f:%l:%c\ -\ %t%.%#:\ %m
