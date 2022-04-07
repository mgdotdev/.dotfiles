syntax on

set rtp+=~/.fzf
set number
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set incsearch
set history=1000
set termguicolors

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

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

