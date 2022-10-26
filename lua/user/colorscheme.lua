require("catppuccin").setup {
  flavour = "mocha",
  styles = {
    functions = { "bold" }
  },
  integrations = {
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    lsp_saga = true,
    lsp_trouble = true,
    treesitter = true,
    fidget = true,
    which_key = true,
    indent_blankine = {
      enable = true
    }
  },
}

vim.cmd [[colorscheme catppuccin]]
