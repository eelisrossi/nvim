return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-context',
    },
    event = "VeryLazy",
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup {

            ensure_installed = { "lua", "markdown", "markdown_inline", "go", "rust", "c" , "odin"},
            ignore_install = { "" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            auto_install = true,
            modules = {},
            indent = {
                enable = true,
                disable = { "yaml" },
            },
            autopairs = { enable = true },
            textobjects = {
                enable = true,
                lookahead = true,
            },
        }
    end,
}
