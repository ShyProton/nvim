local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local normal = { noremap = true, silent = true, mode="n" }
local visual = { noremap = true, silent = true, mode="v" }

-- jukit settings (maybe move to its own setup file/section)
local venv = "datasci"
vim.g.jukit_inline_plotting = 1
vim.g.jukit_shell_cmd = "workon ".. venv .. " && ipython"
vim.g.jukit_comment_mark = "# "

-- Normal keybinds
wk.register({
  ["<leader>"] = {
    name = "+commands",

    n = {
      name = "+notebook",
      --[[ kd = {"<cmd>JukitOut workon datasci", "Datasci Kernel"}, ]]
      p = {"<cmd>call jukit#convert#notebook_convert('jupyter-notebook')<cr>", "Ipy/Py Convert"},
      -- TODO: Add html, pdf conversions
      k = {"<cmd>call jukit#splits#out_hist_scroll(1)<cr>", "Scroll Up Hist"},
      j = {"<cmd>call jukit#splits#out_hist_scroll(0)<cr>", "Scroll Down Hist"},
      o = {
        name = "+output",
        s = {"<cmd>call jukit#splits#output()<cr>", "Output Split"},
        d = {"<cmd>call jukit#splits#close_output_split()<cr>", "Delete Output Split"},
      },
      s = {"<cmd>call jukit#splits#show_last_cell_output(1)<cr>", "Show Cell Output"},
    },

    c = {
      name = "+code/cells",
      c = {"<cmd>call jukit#cells#create_below(0)<cr>", "Code Cell Below"},
      C = {"<cmd>call jukit#cells#create_above(0)<cr>", "Code Cell Above"},
      t = {"<cmd>call jukit#cells#create_below(1)<cr>", "Text Cell Below"},
      T = {"<cmd>call jukit#cells#create_above(0)<cr>", "Text Cell Above"},
      D = {"<cmd>call jukit#cells#delete()<cr>", "Delete Cell"},
      s = {"<cmd>call jukit#cells#split()<cr>", "Split Cell"},
      m = {"<cmd>call jukit#cells#merge_below()<cr>", "Merge Below"},
      M = {"<cmd>call jukit#cells#merge_above()<cr>", "Merge Above"},
      k = {"<cmd>call jukit#cells#move_up()<cr>", "Move Up Cell"},
      j = {"<cmd>call jukit#cells#move_down()<cr>", "Move Down Cell"},
    },

    r = {
      name = "+run",
      c = {"<cmd>call jukit#send#section(0)<cr>", "Run Cell"},
      l = {"<cmd>call jukit#send#line()<cr>", "Run Line"},
      u = {"<cmd>call jukit#send#until_current_selection()<cr>", "Run Until Current"},
      a = {"<cmd>call jukit#send#all()<cr>", "Run All"}
    }
  }
}, normal)

