-- netrw stuff

vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0

vim.api.nvim_create_autocmd('filetype', {
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

