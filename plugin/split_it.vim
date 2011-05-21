" ============================================================================
" File:        split_it.vim
" Description: vim plugin that makes creating multiple split views easier
" Maintainer:  Brandon Orther <brandon.orther at gmail dot com>
" Last Change: April 20th, 2011
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================

" Setup
" ------------------------------------------------------------------------------
let s:split_it_version = '0.0.2'
if exists("g:split_it_loaded")
    finish
endif
let g:split_it_loaded = 1
let s:save_cpo = &cpo
set cpo&vim

" set default layout to a single window:w
let s:layout = [1]

" set auto split off by default
let s:autosplit = 0

" Commands
" ------------------------------------------------------------------------------
command -nargs=+ SplitIt :call <SID>splitItColGrid(<f-args>)
command -nargs=0 SplitItLayout :call <SID>splitItLayout()
command -nargs=0 SplitItAutoLayout :call <SID>splitItAutoLayout()
command -nargs=0 SplitItSetAuto :call <SID>splitItSetAuto()
command -nargs=+ SplitItSetLayout :call <SID>splitItSetLayout(<f-args>)

" Autocommands
" ------------------------------------------------------------------------------
augroup SplitIt
    " create splits using set layout when entering vim when auto split is on
    autocmd GUIEnter * call s:splitItAutoLayout()
augroup END

" Functions
" ------------------------------------------------------------------------------
" Create layout grid based on columns with variable amount of rows
fun! s:splitItColGrid(...)
    " mark this window as split
    let w:split_it_this_window_split = 1
    " loop to build columns
    for num_cols in a:000
        " create column
        :vsplit
        " mark this window as split
        let w:split_it_this_window_split = 1
        " loop to create rows for current column
        for row_i in range(2, num_cols)
            "create row
            :split
            " mark this window as split
            let w:split_it_this_window_split = 1
        endfor
        " move to next column
        :wincmd l
    endfor
    " close last uneeded viewport
    :close
endfun

" Split screen using set layout
fun! s:splitItLayout()
    :call call (function('s:splitItColGrid'), s:layout)
endfun

" Split screen using set layout only if auto is set
fun! s:splitItAutoLayout()
    if s:autosplit == 1
        :call call (function('s:splitItColGrid'), s:layout)
    endif
endfun

" Set the layout to auto split when entering vim
fun! s:splitItSetAuto()
    let s:autosplit = 1
endfun

" Set the layout to be used when SplitItLayout is called
fun! s:splitItSetLayout(...)
    let s:layout = a:000
endfun

" Cleanup
" ------------------------------------------------------------------------------
let &cpo= s:save_cpo
unlet s:save_cpo
