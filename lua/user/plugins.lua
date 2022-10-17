local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer --
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Dependencies --
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Utilities --
  use {
    "akinsho/toggleterm.nvim", -- Toggleable terminal
    branch = "main",
  }
  use "windwp/nvim-autopairs" -- Automatically close braces, brackets, etc.
  use "numToStr/Comment.nvim" -- Commenting shortcuts
  use "lewis6991/gitsigns.nvim" -- Git features
  use "kyazdani42/nvim-tree.lua" -- File navigation
  use "lewis6991/impatient.nvim" -- Improves startup time
  use "ahmedkhalf/project.nvim" -- Project selection
  use "nathom/filetype.nvim" -- Improves startup time
  use "antoinemadec/FixCursorHold.nvim" -- Fixes cursorhold performance
  use "tpope/vim-surround" -- Easily change/add/delete parentheses, quotes...
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  } -- Highlight and search TODO-esque comments
  use {
    "folke/trouble.nvim", -- Shows all warnings/errors/info... in the project
    config = function()
      require("trouble").setup {
        signs = {
          error = " ",
          warning = " ",
          hint = " ",
          information = " "
        }
      }
    end
  }
  use "simrat39/symbols-outline.nvim" -- Outline tree of variables, fns, etc.
  -- TODO: Figure this plugin out its weird
  -- use {
  --   "nvim-neorg/neorg", -- Neovim org mode for documentation or note-taking
  --   config = function ()
  --     require("neorg").setup{
  --       load = {
  --         ["core.defaults"] = {},
  --         -- ["core.norg.concealer"] = {},
  --         ["core.norg.dirman"] = {
  --           config = {
  --             workspaces = {
  --               random = "/home/shayanr/Documents/notes/random"
  --             }
  --           }
  --         }
  --       }
  --     }
  --   end
  -- }
  --[[ use "ianding1/leetcode.vim" ]]

  -- Buffers --
  use {
    "akinsho/bufferline.nvim", --Clean looking buffers and buffer utilities
    branch = "main",
  }
  use "moll/vim-bbye" -- Closing buffers without messiness

  -- Color schemes --
  -- use "Mofiqul/dracula.nvim"
  -- use "navarasu/onedark.nvim" -- Onedark color scheme
  -- use "tanvirtin/monokai.nvim" -- Monokai color scheme
  -- use "marko-cerovac/material.nvim" -- Material color scheme
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }

  -- Aesthetics --
  use "kyazdani42/nvim-web-devicons" -- Dev icons in Neovim
  use "nvim-lualine/lualine.nvim" -- Improved status line
  use "lukas-reineke/indent-blankline.nvim" -- Indentation lines
  use "goolord/alpha-nvim" -- Neovim startup screen
  use {
    "andweeb/presence.nvim",
    config = function()
      require("presence"):setup {
        neovim_image_text = "Neovim",
        main_image = "file"
      }
    end
  } -- Discord rich presence
  -- use {
  --   "rcarriga/nvim-notify", -- Better looking notifications
  --   config = function ()
  --     require("notify").setup{stages = "fade"}
  --   end
  -- }

  -- Completion --
  use "hrsh7th/nvim-cmp" -- Completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp support
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lua" -- Cmp Lua

  -- Snippets --
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- collection of common snippets in many languages

  -- LSP --
  use "williamboman/mason.nvim" -- Language server (and others) installer
  use "williamboman/mason-lspconfig.nvim" -- Makes Mason work well with lspconfig
  use "neovim/nvim-lspconfig" -- LSP configurations
  --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "tami5/lspsaga.nvim" -- LSP UI Improvements
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end
  }

  -- Telescope --
  use "nvim-telescope/telescope.nvim" -- Universal searcher
  --[[ use "nvim-telescope/telescope-media-files.nvim" -- Show images in telescope ]]

  -- Treesitter --
  use {
    "nvim-treesitter/nvim-treesitter", -- improved syntax highlighting
    run = ":TSUpdate",
  }
  use { "nvim-treesitter/nvim-treesitter-context" } -- shows context of visible contents

  -- Flutter --
  -- use "akinsho/flutter-tools.nvim"
  -- use "Nash0x7E2/awesome-flutter-snippets";
  -- use "dart-lang/dart-vim-plugin"
  -- use "tiagofumo/dart-vim-flutter-layout";

  -- Python --
  -- use {
  --   "dccsillag/magma-nvim", -- Jupyter support in neovim
  --   run = ":UpdateRemotePlugins",
  -- };

  use {
    "luk400/vim-jukit",
    -- json is needed since .ipynb are formatted in json
    ft = { "python" },
  }

  -- Databases
  -- TODO: Figure out why the UI for this is buggy
  use { "tpope/vim-dadbod" }
  use { "kristijanhusak/vim-dadbod-ui" }

  -- Java
  use { "mfussenegger/nvim-jdtls", ft = { "java" } }

  -- Web --
  -- TODO: Make these plugins only load with their respective languages
  use {
    "windwp/nvim-ts-autotag", -- Auto-close html tags
    config = function()
      require("nvim-ts-autotag").setup {}
    end
  }

  use {
    "RRethy/vim-hexokinase", -- Show color swatch next to color value
    run = 'make hexokinase'
  }

  use {
    "jose-elias-alvarez/nvim-lsp-ts-utils", -- Typescript utilities
    config = function()
      require("nvim-lsp-ts-utils").setup {}
    end
  }

  use "JoosepAlviste/nvim-ts-context-commentstring" -- JSX/TSX contextual commenting
  use "mattn/emmet-vim" -- Emmet support in (neo)vim

  -- Smooth scrolling with certain scrolling commands
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end
)
