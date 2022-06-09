local capabilities = require("user.cmp")

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

vim.diagnostic.config{
    signs = false,
    update_in_insert = true,
}

require("lspconfig").pyright.setup{
    capabilities = capabilities
}
require("lspconfig").gopls.setup{
    capabilities = capabilities
}
require("lspconfig").bashls.setup{
    capabilities = capabilities
}
require("lspconfig").rust_analyzer.setup{
    capabilities = capabilities
}
require("lspconfig").svelte.setup{
    capabilities = capabilities
}
require("lspconfig").sumneko_lua.setup{
    capabilities = capabilities
}
require("lspconfig").tsserver.setup{
    capabilities = capabilities
}
require("lspconfig").jsonls.setup{
    capabilities = capabilities
}
require("lspconfig").html.setup{
    capabilities = capabilities
}
require("lspconfig").dockerls.setup{
    capabilities = capabilities
}
require("lspconfig").clangd.setup{
    capabilities = capabilities
}

