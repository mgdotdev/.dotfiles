require("vimrc")

require("plugins")
require("lsp")
require("cmp")

require("user.telescope")
require("user.comment")
require("user.snippets")
require("user.nvim-tree")

vim.g.python3_host_prog = "/usr/bin/python"
vim.g.ack_use_cword_for_empty_search = 1
vim.g.indentLine_char = '┆'
vim.g.markdown_syntax_conceal = 0
vim.g.mapleader = " "

vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 10
vim.opt.pumheight = 10
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.laststatus = 2
vim.opt.incsearch = true
vim.opt.history = 10000
vim.opt.guicursor = "i:block"
vim.opt.signcolumn = "no"

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>")
vim.keymap.set("n", "rn", vim.lsp.buf.rename)
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "gf", "<CMD>edit <cfile><CR>")
vim.keymap.set("n", "<leader>a", ":lua require('telescope.builtin').live_grep()<CR>")
vim.keymap.set("n", "<leader>A", ":lua require('telescope.builtin').grep_string()<CR>")
vim.keymap.set("n", "<leader>z", ":lua require('telescope.builtin').find_files()<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>E", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader><C-e>", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>b", ":lua require('telescope.builtin').buffers()<CR>")
vim.keymap.set("n", "<leader>db", "<CMD>bd!<CR>")
vim.keymap.set("n", "<leader>dB", ":execute '%bdelete|edit#|bdelete#'<CR>")
vim.keymap.set("n", "<leader>x", ":NvimTreeToggle<CR>")

vim.keymap.set("v", "<leader>s", "S")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set({"n", "v"}, "<leader>p", '"+p')