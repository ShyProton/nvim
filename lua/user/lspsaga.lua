local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.setup {
  use_saga_diagnostic_sign = false,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",

  code_action_icon = "",

  finder_action_keys = {
    scroll_down = "<Tab>",
    scroll_up = "<S-Tab>",
  },

  border_style = "round",
}
