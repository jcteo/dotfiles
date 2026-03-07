--vim.lsp.set_log_level("debug")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

--[[capabilities.workspace.didChangeConfiguration.dynamicRegistration = true
capabilities.workspace.didChangeWorkspaceFolders = {
  dynamicRegistration = true,
}
capabilities.textDocument.completion.completionItem.snippetSupport = true]]

--[===[ For all ls's?
vim.lsp.config('*', {
  capabilities = capabilities
})
--]===]


-- EMF general purpose lenguage server
-- show less errors, vscode-langservers-extracted do not works with less errors
local lessc = {
  lintCommand = "lessc --no-color ${INPUT}",
  lintStdin = false,
  lintIgnoreExitCode = true,
  lintFormats = {
    "%E%m in %f on line %l, column %c:", -- Formato para errores de lessc
    "%-G%.%#"
  },
  rootMarkers = {"package.json", ".git"}
}

vim.lsp.config('efm', {
  capabilities = capabilities,
  init_options = {documentFormatting = true},
  settings = {
    languages = {
      less = {lessc}
    }
  },
  rootMarkers = {"package.json", ".git"},
  filetypes = {"less"}
})

vim.lsp.enable('efm')

vim.lsp.config("ts_ls", {
  capabilities = capabilities
})

vim.lsp.enable("ts_ls")

vim.lsp.config('emmet_language_server', {
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
  }
})

vim.lsp.enable("emmet_language_server")

-- No esta mostrando errores de less como variables no definidas
--[[vim.lsp.config("cssls", {
  capabilities = capabilities,
  settings = {
    less = {
      validate = true,
      lint = {
        unknownVariables = "error"
      }
    }
  }
})
vim.lsp.enable("cssls")]]

--[[vim.lsp.config('vscode-html-language-server', {
  capabilities = capabilities
})
vim.lsp.enable("vscode-html-language-server")]]

--[[vim.lsp.config('html', {
  capabilities = capabilities
})
vim.lsp.enable('html')]]

--]===]


