local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignHint", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- virtual text diagnostics
    virtual_text = {
      format = function(diagnostic)
        -- terminate vtext after the first line
        local position = string.find(diagnostic.message, "\n")

        -- removes the extra space at the end if a newline has been found
        -- TODO: Find out if this messes up the message for non-rust diagnostics
        if (position) then
          position = position - 1
        end

        return string.sub(diagnostic.message, 1, position)
      end
    },
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = false }

  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", ":Lspsaga rename<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ch", ":Lspsaga hover_doc<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cp", ":Lspsaga preview_definition<CR>", opts)
  --
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "J", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)


  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":Lspsaga lsp_finder<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  --
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  --
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  --
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  --
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

M.on_attach = function(client, bufnr)
  local servers_with_builtin_formatting = {
    "null-ls",
    "clangd",
    "rust_analyzer",
    "sumneko_lua",
    "jdtls",
  }

  -- TODO: Better organize which lsps to include and exclude from formatting
  if servers_with_builtin_formatting[client.name] then
    --[[ if client.name ~= "null-ls" ]]
    --[[     and client.name ~= "clangd" ]]
    --[[     and client.name ~= "rust_analyzer" ]]
    --[[     and client.name ~= "sumneko_lua" then ]]
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  --[[ if ( ]]
  --[[     client.name == "tsserver" or ]]
  --[[         client.name == "cssls" or ]]
  --[[         client.name == "svelte" ]]
  --[[     ) then ]]
  --[[   client.resolved_capabilities.document_formatting = false ]]
  --[[   client.resolved_capabilities.document_range_formatting = false ]]
  --[[ end ]]

  -- TODO: Have this plugin be loaded via filetype specification instead of here
  --[[ local ts_utils = require("nvim-lsp-ts-utils") ]]
  --[[ ts_utils.setup({}) ]]
  --[[ ts_utils.setup_client(client) ]]

  --[[ local opts = { noremap = true, silent = false } ]]

  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>to", "<cmd>TSLspOrganize<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>tr", "<cmd>TSLspRenameFile<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ti", "<cmd>TSLspImportAll<CR>", opts)

  --[[ end ]]

  -- Autoformat
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({bufnr = bufnr})")

  -- Autosave
  --[[ vim.cmd("au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif") ]]

  local status_ok, ih = pcall(require, "inlay-hints");
  if status_ok then
    -- TODO: Find a way to immediately render type hints without editing the file first.
    --[[ ih.render(); ]]
    ih.on_attach(client, bufnr);
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

-- local status_ok, coq_nvim = pcall(require, "coq")
-- if not status_ok then
--   return
-- end

-- M.capabilities = coq_nvim.lsp_ensure_capabilities(capabilities)

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
