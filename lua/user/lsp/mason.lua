local status_ok, _ = pcall(require, "mason")
if not status_ok then
  return
end

require("mason").setup()
require("mason-lspconfig").setup()

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("mason-lspconfig").setup_handlers {
  --[[ ["lua-language-server"] = function () ]]
  --[[   local sumneko_opts = require("user.lsp.settings.sumneko_lua") ]]
  --[[   opts = vim.tbl_deep_extend("force", sumneko_opts, opts) ]]
  --[[   require("lspconfig")["lua-language-server"].setup {opts} ]]
  --[[ end, ]]

  function(server_name)
    local lang_opts = require("user.lsp.settings." .. server_name)
    opts = vim.tbl_deep_extend("force", lang_opts, opts)
    -- Change to round if something goes horribly wrong
    require("lspconfig")[server_name].setup(opts)
  end
}
