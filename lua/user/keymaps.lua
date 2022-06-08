local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-l>", "<cmd>BufferLineMoveNext<CR>", opts)
keymap("n", "<A-h>", "<cmd>BufferLineMovePrev<CR>", opts)
keymap("n", "<C-x>", "<cmd>Bdelete!<CR>", opts)

-- Insert --
keymap("i", "<C-[>", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<C-s>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)

-- NvimTree --
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Terminal --
keymap("n", "<C-]>", "<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=95\"<cr>", opts)
keymap("n", "<C-\\>", "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>", opts)
keymap("t", "<C-]>", "<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=95\"<cr>", opts)
keymap("t", "<C-\\>", "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>", opts)

keymap("n", "<C-t>", "<cmd>ToggleTermToggleAll<cr>", opts)
keymap("t", "<C-t>", "<cmd>ToggleTermToggleAll<cr>", opts)

-- Formatting --
keymap("n", "<leader>\\", "<cmd>Format<cr>", opts)

-- Flutter --
-- keymap("n", "<leader>ff", "<cmd>Telescope flutter commands<CR>", opts)
-- keymap("n", "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", opts)
-- keymap("n", "<leader>fr", "<cmd>FlutterRun<CR>", opts)
-- keymap("n", "<leader>fR", "<cmd>FlutterRestart<CR>", opts)
-- keymap("n", "<leader>fq", "<cmd>FlutterQuit<CR>", opts)
-- keymap("n", "<leader>fd", "<cmd>FlutterDetach<CR>", opts)

-- Magma --
keymap("v", "<leader>nr", "<cmd>MagmaEvaluateVisual<CR>", opts)
keymap("n", "<leader>nr", "<cmd>MagmaReevaluateCell<CR>", opts)
keymap("n", "<leader>nl", "<cmd>MagmaEvaluateLine<CR>", opts)
keymap("n", "<leader>nd", "<cmd>MagmaDelete<CR>", opts)
keymap("n", "<leader>no", "<cmd>MagmaShowOutput<CR>", opts)

-- Gitsigns --
keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", opts)

-- Trouble --
keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
