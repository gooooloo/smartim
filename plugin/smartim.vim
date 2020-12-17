" =============================================================================
" A plugin to make vim stand well with input methods (Mac only)
" Author:       Ying Bian <bianying@gmail.com>
" Last Change:  2017-03-30
" Version:      1.0.0
" Repository:   https://github.com/ybian/smartim
" License:      MIT
" =============================================================================

if exists('g:smartim_loaded') || &cp
  finish
endif
let g:smartim_loaded = 1

if !exists("g:smartim_default")
  let g:smartim_default = "com.apple.keylayout.US"
endif

if !exists("g:smartim_chinese")
  let g:smartim_chinese = "com.apple.inputmethod.SCIM.Shuangpin"
endif

if !exists("g:smartim_disable")
  let g:smartim_disable = 0
endif

let g:smartim_type = g:smartim_default

if !exists("s:imselect_path")
  let s:imselect_path = expand('<sfile>:p:h') . "/im-select "
endif

function! Smartim_SelectDefault()
  if g:smartim_disable == 1
    return
  endif

  if g:smartim_type == g:smartim_default
    return
  endif

  let g:smartim_type = g:smartim_default
  silent call system(s:imselect_path . g:smartim_default)
endfunction

function! Smartim_SelectChinese()
  if g:smartim_disable == 1
    return
  endif

  if g:smartim_type == g:smartim_chinese
    return
  endif

  let g:smartim_type = g:smartim_chinese
  silent call system(s:imselect_path . g:smartim_chinese)
endfunction

function! Smartim_SelectSwitch()
  if g:smartim_disable == 1
    return
  endif

  if g:smartim_type == g:smartim_default
    let g:smartim_type = g:smartim_chinese
    silent call system(s:imselect_path . g:smartim_chinese)
  else
    let g:smartim_type = g:smartim_default
    silent call system(s:imselect_path . g:smartim_default)
  endif
endfunction

autocmd InsertLeave * call Smartim_SelectDefault()