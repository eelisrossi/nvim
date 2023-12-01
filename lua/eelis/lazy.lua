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
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- lsp-related things
  { "j-hui/fidget.nvim" },
  
  -- git related things
  { "lewis6991/gitsigns.nvim" },


  -- utility stuff

  { 
    "nvim-telescope/telescope.nvim", tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  },

  { "nvim-lua/plenary.nvim" },

  { 
    "theprimeagen/harpoon", 
    branch = "harpoon2", 
    requires = { {"nvim-lua/plenary.nvim"} },
  }, 

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  
  { 'folke/which-key.nvim', opts = {} },

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
