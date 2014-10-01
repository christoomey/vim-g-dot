" g-dot.vim - Apply . (repeat last command) over motion
" Maintainer:   Chris Toomey <http://ctoomey.com/>
" Version:      0.1
" Source: http://github.com/christoomey/vim-g-dot

if exists("g:loaded_g_dot") || &compatible || v:version < 700
  finish
endif
let g:loaded_g_dot = 1

function! s:g_dot(mode) abort
  if a:mode == 'line'
    " echom 'line'
    '[,']normal .
  elseif a:mode == 'char'
    " echom 'char'. `[ and `] mark the begininning and end of the change
    let first_line = line('.')
    normal! `]
    let last_line = line('.')
    execute first_line.",".last_line."normal ."
  elseif a:mode == 'V'
    " echom 'visual line'
    '<,'>normal .
  elseif a:mode == ''
    " echom 'block visual'
    '<,'>normal .
  endif
endfunction

xnoremap <silent> <Plug>GDot :<C-U>call <SID>g_dot(visualmode())<CR>
nnoremap <silent> <Plug>GDot :<C-U>set opfunc=<SID>g_dot<CR>g@

nmap g. <Plug>GDot
vmap g. <Plug>GDot
vmap . <Plug>GDot
