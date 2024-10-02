return {

  -- -- ui/theme-related stuff
  -- { "catppuccin/nvim",        name = "catppuccin", priority = 1000 },

  -- -- autocompletion & lsp
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     -- Snippet Engine & its associated nvim-cmp source
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',
  --
  --     -- Adds LSP completion capabilities
  --     'hrsh7th/cmp-nvim-lsp',
  --
  --     -- Adds a number of user-friendly snippets
  --     'rafamadriz/friendly-snippets',
  --   },
  --   config = function()
  --     require("eelis.config.nvim-cmp")
  --   end,
  -- },
  --
  -- {
  --   'williamboman/mason.nvim',
  --   config = function()
  --     require("eelis.config.mason")
  --   end,
  -- },
  --
  -- {
  --   "neovim/nvim-lspconfig",
  --   event = { "BufRead", "BufNewFile" },
  --   dependencies = {
  --     'williamboman/mason.nvim',
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     { "j-hui/fidget.nvim", opts = {} },
  --
  --     'folke/neodev.nvim',
  --   },
  --   config = function()
  --     require("eelis.config.lsp")
  --   end,
  -- },

  -- git related things
  { "lewis6991/gitsigns.nvim" },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },


  -- utility stuff

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

