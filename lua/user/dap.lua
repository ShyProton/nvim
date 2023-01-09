local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.lldb = {
  type = "executable",
  command = "rust-lldb",
  name = "lldb"
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "lldb",
    request = "launch",
    program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
    --[[ program = function() ]]
    --[[   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') ]]
    --[[ end, ]]
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    --[[ sourceLanguages = { "rust" }, ]]
  },
}

dap.set_log_level('TRACE')

require("dapui").setup()
