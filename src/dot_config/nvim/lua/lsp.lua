vim.lsp.config('*', {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
})

--[===[ taken from web guide, didn't work
local servers = { 'tsserver' }
for _, lsp in pairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilites = capabilities,
  })
  vim.lsp.enable(lsp)
end
--]===]

vim.lsp.config('tsserver', {
  cmd = { 'typescript-language-server', '--stdio' },
  file_types = {'javascript', 'typescript'},
  capabilities = capabilities,
})

vim.lsp.enable("tsserver")
