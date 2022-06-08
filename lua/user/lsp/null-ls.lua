local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    -- Python
    formatting.black.with { extra_args = { '--fast' } },
    diagnostics.flake8,

    -- Dart
    -- formatting.dart_format,

    -- Web
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettierd
  },
}
