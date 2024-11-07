local augroup = vim.api.nvim_create_augroup
local hdzgroup = augroup('eelis', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- netrw stuff
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

autocmd('filetype', {
    group = hdzgroup,
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
        end

        bind('h', '-^')
        bind('l', '<CR>')
    end
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 60,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = hdzgroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd('LspAttach', {
    group = hdzgroup,
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = e.buf, desc = "LSP Go to definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = e.buf, desc = "LSP Hover" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = e.buf, desc = "LSP Workspace Symbol" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { buffer = e.buf, desc = "LSP Open Float" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = e.buf, desc = "LSP Code Action" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { buffer = e.buf, desc = "LSP References" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = e.buf, desc = "LSP Rename" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { buffer = e.buf, desc = "LSP Signature Help" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            { buffer = e.buf, desc = "LSP Diag Go to next" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            { buffer = e.buf, desc = "LSP Diag Go to prev" })
    end
})
