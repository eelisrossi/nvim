return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
        "j-hui/fidget.nvim",
        'saghen/blink.cmp',
    },

    config = function()
        local util = require "lspconfig/util"
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local lspconfig = require('lspconfig')
        lspconfig.zls.setup {
            settings = {
                zls = {
                    semantic_tokens = "partial",
                }
            }
        }

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "powershell_es",
                "gopls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                ["powershell_es"] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.powershell_es.setup {
                        settings = {
                            powershell = {
                                codeFormatting = {
                                    Preset = 'OTBS'
                                }
                            }
                        }
                    }
                end,
                ["gopls"] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.gopls.setup {
                        capabilities = capabilities,
                        cmd = { "gopls" },
                        filetypes = { "go", "gomod", "gowork", "gotmpl" },
                        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                        settings = {
                            gopls = {
                                completeUnimported = true,
                                usePlaceholders = true,
                                analyses = {
                                    unusedparams = true,
                                }
                            }
                        }
                    }
                end,
                ["htmx"] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.htmx.setup {
                        filetypes = { "html" }
                    }
                end
            }
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                -- border = "solid",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
