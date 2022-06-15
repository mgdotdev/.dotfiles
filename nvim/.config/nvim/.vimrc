syntax on
colorscheme darcula-solid

hi! NormalNC ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
highlight clear LineNr
highlight clear SignColumn

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MG_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd StdinReadPre * let s:std_in=1
augroup END

