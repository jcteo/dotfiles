require('gitsigns').setup {
  signs = {
    add       = { text = ">" },
    delete    = { text = "<" },
  }
}

require('telescope').load_extension('live_grep_args')

require('octo').setup({
  mappings = {
    review_thread = {
      close_review_tab = { lhs = "<C-q>", desc = "close review tab" }
    },
    submit_win = {
      close_review_tab = { lhs = "<C-q>", desc = "close review tab" }
    },
    review_diff = {
      close_review_tab = { lhs = "<C-q>", desc = "close review tab" }
    },
    file_pannel = {
      close_review_tab = { lhs = "<C-q>", desc = "close review tab" }
    }
  }
})

require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
