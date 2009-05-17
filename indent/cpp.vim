" Vim indent file
" Language:	C++
" Maintainer:	Konstantin Lepa <konstantin.lepa@gmail.com>
" Last Change:	2009 May 16
" Version: 1.0.0

if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

function! GoogleCppIndent()
  let l:cline_num = line('.')
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    let l:pline_num = prevnonblank(l:pline_num - 1)
    let l:pline = getline(l:pline_num)
  endwhile
  let l:retv = cindent('.')
  if l:pline =~# '^\s*template.*'
    let l:retv = cindent(l:pline_num)
  elseif l:pline =~# '^\s*namespace.*'
    let l:retv = 0
  endif

  return l:retv
endfunction

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal textwidth=80
setlocal nowrap

setlocal cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

setlocal indentexpr=GoogleCppIndent()

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

