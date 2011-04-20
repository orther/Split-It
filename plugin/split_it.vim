" ============================================================================
" File:        split_it.vim
" Description: vim plugin that makes creating multiple split views easier
" Maintainer:  Brandon Orther <brandon.orther at gmail dot com>
" Last Change: 19 April, 2011
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================

let s:split_it_version = '0.0.1'

if exists("g:split_it_loaded")
    finish
endif
let g:split_it_loaded = 1
let s:save_cpo = &cpo
set cpo&vim

command -nargs=+ SplitIt :call <SID>splitGrid(<f-args>)

fun! s:splitGrid(...)
    for num_cols in a:000
        " create column
        :vsplit
        " loop to create rows for current column
        for row_i in range(2, num_cols)
            "create row
            :split
        endfor
        " move to next column
        :wincmd l
    endfor
    " close last uneeded viewport
    :close
endfun

let &cpo= s:save_cpo
unlet s:save_cpo
