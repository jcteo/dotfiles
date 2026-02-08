--[===[
vim.lsp.set_log_level("debug")
--]===]

local capabilities = require("ddc_source_lsp").make_client_capabilities()
capabilities.workspace.didChangeConfiguration.dynamicRegistration = true
capabilities.workspace.didChangeWorkspaceFolders = {
  dynamicRegistration=true,
}

--[===[
vim.lsp.config('*', {
  capabilities = capabilities
})
--]===]

vim.lsp.config("tsserver", {
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  file_types = {"javascript", "typescript"},
})

vim.lsp.enable("tsserver")

--[===[
vim.lsp.config('emmet_language_server', {
  cmd = { 'emmet-language-server', '--node-ipc', '--stdio' },
  file_types = {'html', 'css'},
  root_markers = {'.git'},
  init_options = {
    includeLanguages = {},
    excludeLanguages = {},
    extensionsPath = {},
    preferences = {},
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
    syntaxProfiles = {},
    variables = {},
  },
})

--]===]

vim.lsp.config('emmet_language_server', {
  file_types = {'html'},
  capabilities = capabilities
})
vim.lsp.enable("emmet_language_server")

vim.lsp.config('vscode-html-language-server', {
  capabilities = capabilities
})
vim.lsp.enable("vscode-html-language-server")

--[===[
vim.lsp.config("emmet_ls", {
  cmd = { "emmet-ls", "--stdio" },
  file_types = {'html', 'css'},
  init_options = {
    html = {
      options = {
        ["beam.enabled"] = true,
      }
    }
  },
  root_markers = {'.git'},
})


vim.lsp.config('emmet_ls', {
  capabilities = capabilities
})
vim.lsp.enable('emmet_ls')

vim.lsp.config('html', {
  capabilities = capabilities
})
vim.lsp.enable('html')

--]===]
