" =============================================================================
" A plugin to make vim stand well with input methods (Mac only)
" Author:       Ying Bian <bianying@gmail.com>
" Last Change:  2017-03-30
" Version:      1.0.0
" Repository:   https://github.com/ybian/smartim
" License:      MIT
" =============================================================================

if exists('s:smartim_loaded') || &cp
  finish
endif
let s:smartim_loaded = 1

if !exists("g:smartim_english")
  let g:smartim_english = "com.apple.keylayout.US"
endif

if !exists("g:smartim_chinese")
  let g:smartim_chinese = "com.apple.inputmethod.SCIM.Shuangpin"
endif

if !exists("g:imselect_path")
  let g:imselect_path = expand('<sfile>:p:h') . "/im-select "
endif

let g:smartim_enter_as_chinese = 0

function! Smartim_on_normal()
  if g:smartim_enter_as_chinese == 1
    let g:smartim_enter_as_chinese = 0
    silent call system(g:imselect_path . g:smartim_english)
  endif
endfunction

function! Smartim_on_insert()
  if g:smartim_enter_as_chinese == 1
    silent call system(g:imselect_path . g:smartim_chinese)
  endif
endfunction

autocmd InsertLeave * call Smartim_on_normal()
autocmd InsertEnter * call Smartim_on_insert()