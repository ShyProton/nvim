local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
}

vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = false

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- vim.wo.colorcolumn = "99999"
-- vim.g.indent_blankline_context_patterns = {
--   "statement", "switch_body",
--   "declaration", "expression", "pattern", "primary_expression",
-- }

vim.cmd [[highlight ContextHighlight guifg=#a6adc8 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "space:"
-- vim.opt.listchars:append "eol:↴"

indent_blankline.setup({
  -- show_end_of_line = true,
  -- space_char_blankline = "▏",
  show_current_context = true,

  char_highlight_list = {
    -- "IndentBlanklineIndent3",
    -- "IndentBlanklineIndent1",
  },

  context_highlight_list = {
    "ContextHighlight",
  }
})
