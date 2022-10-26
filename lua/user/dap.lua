local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",

  executable = {
    command = '/home/shayanr/.local/share/nvim/mason/bin/codelldb',
    args = { "--port", "${port}" },
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dapui").setup()
