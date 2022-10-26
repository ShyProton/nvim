local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.init_lsp_saga({
  --[[ use_saga_diagnostic_sign = false, ]]
  --[[ error_sign = "", ]]
  --[[ warn_sign = "", ]]
  --[[ hint_sign = "", ]]
  --[[ infor_sign = "", ]]

  diagnostic_header = { " ", " ", " ", " " },
  move_in_saga = { prev = '<S-Tab>', next = "<Tab>" },

  code_action_lightbulb = {
    enable = false,
    enable_in_insert = false,
    sign = false
  },

  code_action_icon = "  ",

  show_outline = {
    jump_key = "<cr>"
  },

  border_style = "rounded",
})

--[[ lspsaga.setup { ]]
--[[   use_saga_diagnostic_sign = false, ]]
--[[   error_sign = "", ]]
--[[   warn_sign = "", ]]
--[[   hint_sign = "", ]]
--[[   infor_sign = "", ]]
--[[]]
--[[   code_action_icon = "", ]]
--[[]]
--[[   finder_action_keys = { ]]
--[[     scroll_down = "<Tab>", ]]
--[[     scroll_up = "<S-Tab>", ]]
--[[   }, ]]
--[[]]
--[[   border_style = "round", ]]
--[[ } ]]
