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
opt.number = true
opt.relativenumber = true
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
opt.guicursor = "i:block"
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
set("n", "<leader>z", ":lua require('telescope.builtin').find_files()<CR>")
set("n", "<leader>e", diagnostic.goto_next)
set("n", "<leader>E", diagnostic.goto_prev)
set("n", "<leader><C-e>", lsp.buf.code_action)
set("n", "<leader>b", ":lua require('telescope.builtin').buffers()<CR>")
set("n", "<leader>db", ":bd!<CR>")
set("n", "<leader>dB", ":execute '%bdelete|edit#|bdelete#'<CR>")
set("n", "<leader>x", ":NvimTreeToggle<CR>")
set("n", "<leader>w", "<C-w>w")

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

set({"n", "v"}, "<leader>y", '"+y')
set({"n", "v"}, "<leader>p", '"+p')

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", ">", ">gv")
set("v", "<", "<gv")

set("i", ",", ",<c-g>u")
set("i", ".", ".<c-g>u")
set("i", "!", "!<c-g>u")
set("i", "?", "?<c-g>u")

set("i", "<C-c>", "<esc>")
