local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "pyright", "marksman", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    debug = true,
  }
end
--

vim.lsp.set_log_level "debug"

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      analysis = {
        extraPaths = {"/Users/yangyang/PycharmProjects"},
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        logLevel = "Trace",

        stubPath = { "/Users/yangyang/PycharmProjects" },
      },
    },
  },
}
-- lspconfig.jedi_language_server.setup({
--   capabilities = capabilities,
--   on_attach =on_attach,
--   -- cmd = {"jedi-language-server","--workspace.extraPaths","/Users/yangyang/PycharmProjects/test_py"}
-- })
