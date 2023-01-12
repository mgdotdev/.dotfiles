syntax on
colorscheme darcula-solid
set termguicolors
set encoding=utf-8

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

augroup filetypedetect
    autocmd BufRead,BufNewFile *Jenkinsfile set filetype=groovy
augroup END

" ['▏', '⁝', '⋮']
let g:indent_blankline_char = '⋮'
let g:indent_blankline_use_treesitter = v:true

