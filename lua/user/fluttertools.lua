local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  return
end

local M = {}

function M.setup(attach, capabilities)
  flutter_tools.setup{
    lsp = {
      on_attach = attach,
      capabilities = capabilities,
      color = {
        enabled = true,
      }
    },
    decorations = {
      statusline = {
        device = true,
      },
    },
  }
end

return M

