local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  -- Formats on save (blocks neovim until results are applied)

  --[[ on_attach = function(client, bufnr) ]]
  --[[   if client.supports_method("textDocument/formatting") then ]]
  --[[     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr }) ]]
  --[[     vim.api.nvim_create_autocmd("BufWritePre", { ]]
  --[[         group = augroup, ]]
  --[[         buffer = bufnr, ]]
  --[[         callback = function() ]]
  --[[           -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead ]]
  --[[           vim.lsp.buf.formatting_sync() ]]
  --[[         end, ]]
  --[[       }) ]]
  --[[   end ]]
  --[[ end, ]]

  debug = false,
  sources = {
    -- Python
    formatting.black.with { extra_args = { '--fast' } },
    diagnostics.flake8,

    -- Dart
    -- formatting.dart_format,

    -- C
    diagnostics.cpplint,

    -- Web
    --[[ null_ls.builtins.diagnostics.eslint_d.with { ]]
    --[[   filetypes = { ]]
    --[[     "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" ]]
    --[[   } ]]
    --[[ }, ]]
    --[[ null_ls.builtins.code_actions.eslint_d.with { ]]
    --[[   filetypes = { ]]
    --[[     "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" ]]
    --[[   } ]]
    --[[ }, ]]

    formatting.prettierd.with {
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "handlebars",
        "svelte"
      }
    },
  },
}
