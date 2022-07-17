local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local prettier_status_ok, prettier = pcall(require, "prettier")
if not prettier_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("nnoremap <silent><buffer> <Leader>f : lua vim.lsp.buf.formatting()<CR>")
            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
        end

        if client.resolved_capabilities.document_range_formatting then
            vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")

        end
    end
})

prettier.setup({
    bin = 'prettier',
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "jason",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },

    -- prettier format options
    arrow_parens = "always",
    bracket_spacing = true,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as_needed",
    semi = true,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
})
