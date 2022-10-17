local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  return
end

local M = {}

function M.setup(attach, capabilities)
  flutter_tools.setup {
    lsp = {
      on_attach = attach,
      capabilities = capabilities,
      color = {
        enabled = true,
      },
      init_options = {
        suggestFromUnimportedLibraries = false,
      },
    },
    widget_guides = {
      enabled = true,
    },
    outline = {
      auto_open = false,
    },
  }
end

return M
