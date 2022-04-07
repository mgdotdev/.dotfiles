syntax on

set smartindent
set number
set nohlsearch
set noerrorbells
set hidden
set incsearch
set termguicolors
set expandtab
set nowrap
set colorcolumn=80
set scrolloff=8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set incsearch
set history=1000

set rtp+=~/.fzf

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 25
let NERDTreeMinimalUI=1

colorscheme darcula
hi! Normal ctermbg=NONE guibg=NONE
highlight clear LineNr

command Vx Vex!
cnoreabbrev Z FZF

nnoremap Y y$
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MG_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

