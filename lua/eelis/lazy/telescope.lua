return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require('telescope').setup {
            pickers = {
                find_files = {
                    theme = "ivy"
                },
                git_files = {
                    theme = "ivy"
                },
                grep_string = {
                    theme = "ivy"
                },
                diagnostics = {
                    theme = "ivy"
                },
            },
            extensions = {
                fzf = {}
            }
        }

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files" })
        vim.keymap.set('n', '<leader>pc', function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath("config")
            }
        end, { desc = "Nvim config" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files" })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep search" })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Help tags" })
        vim.keymap.set('n', '<leader>pl', builtin.diagnostics, { desc = "LSP Diagnostics" })
    end
}
