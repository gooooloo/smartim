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

if !exists("g:smartim_disable")
  let g:smartim_disable = 0
endif

if !exists("g:smartim_debug")
  let g:smartim_debug = 0
endif

let s:imselect_path = expand('<sfile>:p:h') . "/im-select "
let s:smartim_debug_output = $HOME . "/vim_smartim_debug_output"

function! Smartim_SelectDefault()
  if g:smartim_disable == 1
    return
  endif

  silent let b:saved_im = system(s:imselect_path)
  silent call system(s:imselect_path . g:smartim_default)
endfunction

function! Smartim_SelectSaved()
  if g:smartim_disable == 1
    return
  endif

  if exists("b:saved_im")
    silent call system(s:imselect_path . b:saved_im)
  endif
endfunction

augroup smartim
  autocmd!
  autocmd InsertLeave * call Smartim_SelectDefault()
  autocmd InsertEnter * call Smartim_SelectSaved()
augroup end