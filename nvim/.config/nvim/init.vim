call plug#begin('~/.config/nvim/plugins')
    Plug 'doums/darcula'
    Plug 'mileszs/ack.vim'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
let g:deoplete#enable_at_startup = 1
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
set scrolloff=10
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set incsearch
set history=1000
set guicursor=i:block

set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let mapleader = " "

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 25
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

colorscheme darcula
hi! Normal ctermbg=NONE guibg=NONE
highlight clear LineNr

command Vx Vex!
nnoremap Y y$
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

cnoreabbrev Z FZF
cnoreabbrev A Ack
cnoreabbrev NT NERDTree

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
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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

inoremap <silent><expr> <CR> Expand()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-git', 'coc-svelte', 'coc-tsserver', 'coc-yaml', 'coc-go', 'coc-clangd', 'coc-docker', 'coc-sh', 'coc-snippets']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

