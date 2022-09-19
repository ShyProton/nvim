local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
  return
end

symbols_outline.setup({
  symbols = {
    Variable = {icon = "", hl = "TSConstant"},
    Constant = {icon = "", hl = "TSConstant"},
    Function = {icon = "", hl = "TSFunction"},
    Method = {icon = "m", hl = "TSMethod"},
    Field = {icon = "", hl = "TSField"},
    Constructor = {icon = "", hl = "TSConstructor"},
    String = {icon = "", hl = "TSString"},
    Class = {icon = "", hl = "TSClass"},
    Interface = {icon = "", hl = "TSClass"},
    Module = {icon = "", hl = "TSClass"},
    Enum = {icon = "", hl = "TSClass"},
    EnumMember = {icon = "", hl = "TSClass"},
    Property = {icon = "", hl = "TSClass"},
    Struct = {icon = "", hl = "TSClass"},
    Event = {icon = "", hl = "TSClass"},
    Operator = {icon = "", hl = "TSClass"},
    TypeParameter = {icon = "", hl = "TSClass"},
  }
})
