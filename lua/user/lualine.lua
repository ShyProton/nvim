local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 100
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

local branch = {
  "branch",
  icon = "",
}

local diff = {
  "diff",
  --[[ symbols = { added = " ", modified = "柳", removed = " " }, ]]
}

local encoding = {
  "encoding",
  cond = hide_in_width
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "toggleterm", "dashboard", "NvimTree", "Outline", "alpha", "Trouble" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch, diff },
    lualine_c = { diagnostics },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { encoding },
    lualine_y = { 'filetype' },
    lualine_z = { 'progress', 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
