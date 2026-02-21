vim.lsp.set_log_level("debug")

local capabilities = require("ddc_source_lsp").make_client_capabilities()
capabilities.workspace.didChangeConfiguration.dynamicRegistration = true
capabilities.workspace.didChangeWorkspaceFolders = {
  dynamicRegistration = true,
}
capabilities.textDocument.completion.completionItem.snippetSupport = true

--[===[
vim.lsp.config('*', {
  capabilities = capabilities
})
--]===]

vim.lsp.config("tsserver", {
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = {"javascript", "typescript"},
})

vim.lsp.enable("tsserver")

--[[vim.lsp.config('emmet_language_server', {
  filetypes = {'html', 'javascript', 'typescript', 'js'},
  capabilities = capabilities,
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  
})
vim.lsp.enable("emmet_language_server")
]]
--[[vim.lsp.config('vscode-html-language-server', {
  capabilities = capabilities
})
vim.lsp.enable("vscode-html-language-server")]]

--[[vim.lsp.config("emmet_ls", {
  cmd = { "emmet-ls", "--stdio" },
  capabilities = capabilities,
  filetypes = {'html', 'css'},
  init_options = {
    html = {
      options = {
        ["beam.enabled"] = true,
      }
    }
  },
  root_markers = {'.git'},
})]]

vim.lsp.config("emmet_ls", {
  capabilities = capabilities
})

vim.lsp.enable('emmet_ls')

--[[vim.lsp.config('html', {
  capabilities = capabilities
})
vim.lsp.enable('html')]]

--]===]
