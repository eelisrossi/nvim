-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- all plugins
local plugin_specs = {

  -- ui/theme-related stuff
  { "catppuccin/nvim",        name = "catppuccin", priority = 1000 },

  -- autocompletion & lsp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require("eelis.config.nvim-cmp")
    end,
  },

  {
    'williamboman/mason.nvim',
    config = function()
      require("eelis.config.mason")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      { "j-hui/fidget.nvim", opts = {} },

      'folke/neodev.nvim',
    },
    config = function()
      require("eelis.config.lsp")
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    event = "VeryLazy",
    build = ':TSUpdate',
    config = function()
      require("eelis.config.treesitter")
    end,
  },

  -- git related things
  { "lewis6991/gitsigns.nvim" },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },


  -- utility stuff

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("eelis.config.copilot")
    end,
  },

  { 'folke/which-key.nvim',  opts = {} },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("eelis.config.statusline")
    end,
  },

  { 'numToStr/Comment.nvim', opts = {} },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

}

-- configuration for lazy itself.
local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
}

require('lazy').setup(plugin_specs, lazy_opts)
