local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
--
-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "jiangmiao/auto-pairs"
    use "Vimjas/vim-python-pep8-indent"
    use 'mileszs/ack.vim'
    use 'tpope/vim-surround'
    use 'numToStr/Comment.nvim'
    use 'lambdalisue/nerdfont.vim'
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    use 'lewis6991/gitsigns.nvim'
    use "nvim-treesitter/nvim-treesitter"
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'norcalli/nvim-colorizer.lua'
    use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{
          'nvim-lua/plenary.nvim',
      }}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        "kwkarlwang/bufjump.nvim",
        config = function() require("bufjump").setup() end
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
