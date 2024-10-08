return {


    -- git related things
    { "lewis6991/gitsigns.nvim" },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },


    -- utility stuff

    { 'folke/which-key.nvim',   opts = {} },

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

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            highlight = {
                comments_only = false,
            }
        }
    }

}
