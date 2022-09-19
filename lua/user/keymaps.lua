local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local normal = { noremap = true, silent = true, mode="n" }
local terminal = { noremap = true, silent = true, mode="t" }
local visual = { noremap = true, silent = true, mode="v" }
local vblock = { noremap = true, silent = true, mode="x" }
local insert = { noremap = true, silent = true, mode="i" }

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.db_ui_save_location = "~/.config/db_ui"

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]]

-- Normal keymaps
wk.register({
  -- Leader commands
  ["<leader>"] = {
    name = "+commands",

    -- Hunk commands
    g = {
      name = "+git",
      p = {"<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk"},
      k = {"<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk"},
      j = {"<cmd>Gitsigns next_hunk<cr>", "Next Hunk"},
      r = {"<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk"},
      b = {"<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame"},
      d = {"<cmd>Gitsigns toggle_deleted<cr>", "View Deletions"},
    },

    -- Trouble commands
    x = {
      name = "+trouble",
      e = {"<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics"},
      t = {"<cmd>TodoTrouble<cr>", "Todo List"},
      g = {"<cmd>Gitsigns setqflist<cr>", "Git Hunk List"},
    },

    -- Telescope commands
    f = {
      name = "+file",
      f = {"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>", "Find Files"},
      g = {"<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown())<cr>", "Grep Files"},
      b = {"<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown())<cr>", "Find Buffers"},
      h = {"<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown())<cr>", "Find Help"},
    },

    k = {
      name = "+keymaps",
      a = {"<cmd>WhichKey<cr>", "All Keymaps"},
      n = {"<cmd>WhichKey '' n<cr>", "Normal Keymaps"},
      v = {"<cmd>WhichKey '' v<cr>", "Visual Keymaps"},
      x = {"<cmd>WhichKey '' x<cr>", "V-Block Keymaps"},
      t = {"<cmd>WhichKey '' t<cr>", "Terminal Keymaps"},
    },

    -- TypeScript commands
    t = {
      name = "+typescript",
      o = {"<cmd>TSLspOrganize<cr>", "Organize Imports"},
      r = {"<cmd>TSLspRenameFile<cr>", "Rename File"},
      i = {"<cmd>TSLspImportAll<cr>", "Auto-Import"}
    },

    -- General code commands
    c = {
      name = "+code",
      a = {"<cmd>Lspsaga code_action<cr>", "Code Actions"},
      e = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
      r = {"<cmd>Lspsaga rename<cr>", "Rename"},
      h = {"<cmd>Lspsaga hover_doc<cr>", "Hover Doc"},
      d = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
    },

    -- Symbol Outline command
    o = {"<cmd>SymbolsOutline<cr>", "Outline"},

    -- NvimTree command
    e = {"<cmd>NvimTreeToggle<cr>", "Explorer"},

    -- Mason server managers
    s = {"<cmd>Mason<cr>", "Servers"},

    p = {"<cmd>Format<cr>", "Prettify"},

    d = {
      name = "+databases",
      u = {"<cmd>DBUIToggle<cr>", "Toggle Database UI"},
      f = {"<cmd>DBUIFindBuffer<cr>", "Find Buffer"},
      r = {"<cmd>DBUIRenameBuffer<cr>", "Rename Buffer"},
      l = {"<cmd>DBUILastQueryInfo<cr>", "Last Query Info"}
    }
  },

  -- Emmet
  ["<C-z>"] = {
    name = "+emmet",
    [","] = "Expand Abbr",
    ["/"] = "Toggle Comment",
    [";"] = "Expand Word",
    ["a"] = "Anchorize URL",
    ["A"] = "Anchorize Summary",
    ["D"] = "Balance Tag Outward",
    ["d"] = "Balance Tag Inward",
    ["I"] = "Image Encode",
    ["i"] = "Image Size",
    ["j"] = "Split Join Tag",
    ["k"] = "Remove Tag",
    ["m"] = "Merge Lines",
    ["n"] = "Move Next",
    ["N"] = "Move Prev",
    ["u"] = "Update Tag",
  },

  -- Folds
  ["z"] = "+folds",

  -- General
  ["g"] = {
    name = "+general",
    ["b"] = {
      name = "Block Comment",
      c = "Comment"
    },

    ["c"] = {
      name = "Line Comment",
      c = "Comment Line",
      o = "Comment Below Line",
      O = "Comment Above Line",
      A = "Comment After Line",
    }
  },

  -- Better window navigation
  ["<C-k>"] = {"<C-w>k", "Move Up a Window"},
  ["<C-j>"] = {"<C-w>j", "Move Down a Window"},
  ["<C-l>"] = {"<C-w>l", "Move Right a Window"},
  ["<C-h>"] = {"<C-w>h", "Move Left a Window"},

  -- Arrow window resizing
  ["<C-Up>"] = {":resize +2<cr>", "Increase Window Height"},
  ["<C-Down>"] = {":resize -2<cr>", "Decrease Window Height"},
  ["<C-Right>"] = {":vertical resize +2<cr>", "Increase Window Width"},
  ["<C-Left>"] = {":vertical resize -2<cr>", "Decrease Window Width"},

  -- Bufferline
  ["<S-k>"] = {"<cmd>BufferLineCycleNext<cr>", "Next Buffer"},
  ["<S-j>"] = {"<cmd>BufferLineCyclePrev<cr>", "Previous Buffer"},
  ["<A-k>"] = {"<cmd>BufferLineMoveNext<cr>", "Move Buffer Right"},
  ["<A-j>"] = {"<cmd>BufferLineMovePrev<cr>", "Move Buffer Left"},
  ["<C-x>"] = {"<cmd>Bdelete!<cr>", "Close Buffer"},

  -- Toggleterm
  ["<C-]>"] = {"<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=90\"<cr>", "Open Side Terminal"},
  ["<C-\\>"] = {"<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>", "Open Floating Terminal"},
  ["<C-t>"] = {"<cmd>ToggleTermToggleAll<cr>", "Toggle Terminals"},
}, normal)

-- Visual keymaps
wk.register({
  -- Move text up and down
  ["<A-k>"] = {":m .-2<cr>==", "Move Text Up"},
  ["<A-j>"] = {":m .+1<cr>==", "Move Text Up"},

  -- Stay in visual after indent
  ["<"] = {"<gv", "Unindent"},
  [">"] = {">gv", "Indent"},

  -- Delete then paste
  ["p"] = {'"_dP', "Paste"},

  -- Surround
  ["S"] = "Surround With",

  -- Commands
  ["<leader>"] = "+commands",

  -- Emmet
  ["<C-z>"] = {
    name = "+emmet",
    [","] = "Expand Abbr",
    ["D"] = "Balance Tag Outward",
    ["d"] = "Balance Tag Inward",
    ["c"] = "Code Pretty",
  },

  -- General
  ["g"] = {
    name = "+general",
    ["b"] = "Blockwise Comment Visual",
    ["c"] = "Linewise Comment Visual",
    ["%"] = "Matching Character",
    ["S"] = "which_key_ignore",
  },
}, visual)

-- Visual Block keymaps
wk.register({
  -- Move text up and down
  ["<A-k>"] = {":move '<-2<cr>gv-gv", "Move Text Up"},
  ["<A-j>"] = {":move '>+1<cr>gv-gv", "Move Text Up"},

  -- Surround
  ["S"] = "Surround With",

  -- Commands
  ["<leader>"] = "+commands",

  -- Emmet
  ["<C-z>"] = {
    name = "+emmet",
    [","] = "Expand Abbr",
    ["D"] = "Balance Tag Outward",
    ["d"] = "Balance Tag Inward",
    ["c"] = "Code Pretty",
  },

  -- General
  ["g"] = {
    name = "+general",
    ["b"] = "Blockwise Comment Visual",
    ["c"] = "Linewise Comment Visual",
    ["%"] = "Matching Character",
    ["S"] = "which_key_ignore",
  },
}, vblock)

-- Insert keymaps
wk.register({
  -- Making sure <C-[> is <esc>
  ["<C-[>"] = {"<esc>", "esc"}
}, insert)

-- Terminal keymaps
wk.register({
  -- Better terminla navigation
  ["<C-k>"] = {"<C-\\><C-N><C-w>j", "Move Up a Window"},
  ["<C-j>"] = {"<C-\\><C-N><C-w>h", "Move Down a Window"},
  ["<C-l>"] = {"<C-\\><C-N><C-w>l", "Move Right a Window"},
  ["<C-h>"] = {"<C-\\><C-N><C-w>h", "Move Left a Window"},

  -- Toggleterm
  ["<C-]>"] = {"<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=90\"<cr>", "Open Side Terminal"},
  ["<C-\\>"] = {"<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>", "Open Floating Terminal"},
  ["<C-t>"] = {"<cmd>ToggleTermToggleAll<cr>", "Toggle Terminals"},
}, terminal)
