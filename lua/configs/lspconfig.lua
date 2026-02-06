require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd" }

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
