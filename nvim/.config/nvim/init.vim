call plug#begin('~/.config/nvim/plugins')
    Plug 'doums/darcula'
    Plug 'mileszs/ack.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
call plug#end()

syntax on
colorscheme darcula

set smartindent
set number
set relativenumber
set nohlsearch
set noerrorbells
set hidden
set incsearch
set termguicolors
set expandtab
set nowrap
set colorcolumn=80
set scrolloff=10
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set incsearch
set history=1000
set guicursor=i:block
set signcolumn=no
set rtp+=~/.fzf

let g:python3_host_prog = "/usr/bin/python"
let g:ack_use_cword_for_empty_search = 1
let g:indentLine_char = '┆'
let g:markdown_syntax_conceal=0

let $FZF_DEFAULT_COMMAND =
            \ "
            \ find . -type f
            \ -not -path '*/\.git/*'
            \ -not -path '*/venv/*'
            \ -not -path '*/__pycache__/*'
            \ -not -path '*/\.pytest_cache/*'
            \ "

let mapleader = " "
let g:deoplete#enable_at_startup = 1
let g:coc_global_extensions =
                \ [
                \   'coc-pyright',
                \   'coc-svelte',
                \   'coc-go',
                \   'coc-rust-analyzer',
                \   'coc-clangd',
                \   'coc-tsserver',
                \   'coc-sh',
                \   'coc-json',
                \   'coc-git',
                \   'coc-yaml',
                \   'coc-docker',
                \   'coc-snippets',
                \   'coc-explorer'
                \ ]
let g:ack_mappings = {"gd": "<CR><C-W>p"}

hi! Normal ctermbg=NONE guibg=NONE
highlight clear LineNr

command Vx Vex!
command E CocCommand explorer --sources=buffer+,file+
command! Bd execute '%bdelete|edit#|bdelete#'
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

cnoreabbrev Z FZF
cnoreabbrev A Ack

map gf :edit <cfile><CR>

nmap <leader>Y "+Y
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

vmap <leader>s S

cmap w!! %!sudo tee > /dev/null %

nnoremap Y y$
nnoremap <leader>bb :ls<CR>:b
nnoremap <leader>bda :Bd<CR>
nnoremap <leader>z :FZF<CR>
nnoremap <leader>a :Ack<space>
nnoremap <leader>e :E<space>
nnoremap <leader>y "+y
nnoremap <leader>p "+p

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap <silent><expr> <CR> Expand()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap > >gv
vnoremap < <gv

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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

function! Expand()
    if pumvisible() && complete_info()['selected'] != -1
        return coc#_select_confirm()
    else
        if coc#expandableOrJumpable()
            return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
        else
            return "\<C-g>u\<CR>"
        endif
    endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

