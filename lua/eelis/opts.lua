vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local tabsize = 4
local home = vim.fn.expand('~/.vim/undodir')

opt.expandtab = true     -- Use spaces instead of tabs
opt.shiftround = true    -- Round indent
opt.shiftwidth = tabsize -- Size of an indent
opt.smartindent = true   -- Insert indents automatically
opt.softtabstop = tabsize
opt.tabstop = tabsize    -- Number of spaces tabs count for

opt.wrap = false         -- Disable line wrap

opt.swapfile = false
opt.backup = false
opt.undodir = home
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true       -- True color support
opt.autowrite = true           -- Enable auto write
opt.clipboard = "unnamedplus"  -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 1           -- Hide * markup for bold and italic
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.cursorline = true          -- Enable highlighting of the current line
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.guicursor = ""
opt.ignorecase = true      -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 2         -- global statusline
opt.list = false           -- Show some invisible characters (tabs...
opt.mouse = "a"            -- Enable mouse mode
opt.number = true          -- Print line number
opt.pumblend = 0           -- Popup blend
opt.pumheight = 10         -- Maximum number of entries in a popup
opt.relativenumber = true  -- Relative line numbers
opt.scrolloff = 8          -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false   -- Dont show mode since we have a statusline
opt.sidescrolloff = 8  -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true   -- Don't ignore case with capitals
opt.spelllang = { "en" }
opt.splitbelow = true  -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true  -- Put new windows right of current
opt.timeoutlen = 300
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"          -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width

if vim.fn.has("nvim-0.10") == 1 then
    opt.smoothscroll = true
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

opt.colorcolumn = "80"

-- Enable :find to look through the whole project
vim.cmd("set path+=**")

-- netrw stuff
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 30
