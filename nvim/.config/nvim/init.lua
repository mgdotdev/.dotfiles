require("plugins")

require("vimrc")

require("lsp")
require("cmp")

require("user.telescope")
require("user.comment")
require("user.snippets")
require("user.nvim-tree")
require("user.gitsigns")
require("user.treesitter")
require("user.treesitter-context")
require("user.colorizer")

local set = vim.keymap.set
local opt = vim.opt
local g = vim.g
local lsp = vim.lsp
local diagnostic = vim.diagnostic

g.python3_host_prog = "/usr/bin/python"
g.ack_use_cword_for_empty_search = 1
g.indentLine_char = '┆'
g.markdown_syntax_conceal = 0
g.mapleader = " "

opt.smarttab = true
opt.cindent = true
opt.smartindent = true
opt.autoindent = true
opt.relativenumber = true
opt.number = true
opt.hlsearch = false
opt.errorbells = false
opt.hidden = true
opt.incsearch = true
opt.termguicolors = true
opt.expandtab = true
opt.wrap = false
opt.colorcolumn = "80"

opt.sidescrolloff = 8
opt.scrolloff = 10
opt.pumheight = 10
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.laststatus = 2
opt.incsearch = true
opt.history = 10000
opt.signcolumn = "no"

set("n", "gd", lsp.buf.definition)
set("n", "gt", lsp.buf.type_definition)
set("n", "gi", lsp.buf.implementation)
set("n", "gr", ":lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>")
set("n", "rn", lsp.buf.rename)
set("n", "Y", "y$")
set("n", "gf", ":edit <cfile><CR>")
set("n", "<leader>a", ":lua require('telescope.builtin').live_grep()<CR>")
set("n", "<leader>A", ":lua require('telescope.builtin').grep_string()<CR>")
set("n", "<leader>/", ":lua require('telescope.builtin').current_buffer_fuzzy_find{sorting_strategy=ascending, prompt_position=top}<CR>")
set("n", "<leader>z", ":lua require('telescope.builtin').find_files()<CR>")
set("n", "<leader>e", diagnostic.goto_next)
set("n", "<leader>E", diagnostic.goto_prev)
set("n", "<leader><C-e>", lsp.buf.code_action)
set("n", "<leader>bv", ":lua require('telescope.builtin').buffers()<CR>")
set("n", "<leader>bn", ":bnext<cr>")
set("n", "<leader>bp", ":bprevious<cr>")
set("n", "<leader>bf", ":lua require('bufjump').forward()<cr>")
set("n", "<leader>bb", ":lua require('bufjump').backward()<cr>")
set("n", "<leader>bd", ":bd!<CR>")
set("n", "<leader>bD", ":execute '%bdelete|edit#|bdelete#'<CR>")
set("n", "<leader>x", ":NvimTreeRefresh<CR>:NvimTreeToggle<CR>")
set("n", "<leader>X", ":NvimTreeRefresh<CR>:NvimTreeFindFile<CR>")
set("n", "<leader>w", "<C-w>w")
set("n", "<leader>q", ":q<CR>")

set("n", "<leader>t", "yiw<esc>i<<esc>ea /><esc>hi")
set("n", "<leader>T", "yiw<esc>i<<esc>ea></><esc>hpF>")
set("n", "<leader><C-t>", "yiw<esc>i<<esc>ea></><esc>hp0vt<yf>a<CR><esc>k$")
set("n", "<leader>hv", ":lua require('gitsigns').preview_hunk()<CR>")
set("n", "<leader>hb", ":lua require('gitsigns').blame_line{full=true}<CR>")
set("n", "<leader>hd", ":lua require('gitsigns').diffthis()<CR>")
set("n", "<leader>hs", ":lua require('gitsigns').stage_hunk()<CR>")
set("n", "<leader>hu", ":lua require('gitsigns').undo_stage_hunk()<CR>")
set("n", "<leader>hr", ":lua require('gitsigns').reset_hunk()<CR>")
set("n", "<leader>hS", ":lua require('gitsigns').stage_buffer()<CR>")
set("n", "<leader>hR", ":lua require('gitsigns').reset_buffer()<CR>")
set("n", "<leader>hn", ":lua require('gitsigns').next_hunk()<CR>")
set("n", "<leader>hp", ":lua require('gitsigns').prev_hunk()<CR>")

set({"n", "v"}, "<leader>Y", '"+y')
set({"n", "v"}, "<leader>P", '"+p')
set({"n", "v"}, "<leader>p", '"_dP')

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", ">", ">gv")
set("v", "<", "<gv")

set("i", ",", ",<c-g>u")
set("i", ".", ".<c-g>u")
set("i", "!", "!<c-g>u")
set("i", "?", "?<c-g>u")

set({"i", "v", "n", "c"}, "<C-q>", "<esc>")

set("c", "qq", "qa!")
