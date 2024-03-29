" Author:       Chris Grau <113591+sirhc@users.noreply.github.com>
" Created:      08-Dec-2012
" Last Change:  18-Nov-2022
" Version:      0.0.2
" Description:  Run scripts, using the #! line (or /bin/sh by default).

" Exit quickly if runscript.vim has already been loaded, 'compatible' is set,
" or VIM is not at least version 7.
if exists('g:runscript_version') || &cp || v:version < 700
    finish
endif

let g:runscript_version = '0.0.2'

function! BangPath(...)
    if exists("b:runscript_interpreter")
        return b:runscript_interpreter
    endif

    if getline(1) =~# '^#!'
        " Spaces can exist between the #! and the command path:
        "
        "     #! /bin/sh

        return matchstr(getline(1), '.*', matchend(getline(1), '^#! *'))
    endif

    return a:1
endfunction

function! RunScript(...)
    if exists("g:runscript_pager")
        let l:pager = g:runscript_pager
    else
        let l:pager = 'less'
    endif

    exe '!clear; ' . BangPath('/bin/sh') . ' ' . join(a:000, ' ') . ' "%" 2>&1 | ' . l:pager
endfunction
