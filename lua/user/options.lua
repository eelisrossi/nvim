-- :help options
-- 

local options = {

    exrc = true,
    backup = false, 				        -- creates a backup file
    clipboard = "unnamedplus", 	            -- allows neovim to access the system clipboard
    cmdheight = 2, 			            	-- more space in the neovim command line for displaying messages
    --completeopt = { "menuone", "noselect" },-- mostly just for cmp
    conceallevel = 0, 		    	        -- so that `` is visible in markdown files
    fileencoding = "utf-8",  		        -- the encoding written to a file
    hlsearch = true, 		    	        -- highlight all matches on previous search pattern
    ignorecase = true, 			            -- ignore case in search patterns
    mouse = "a", 			    	        -- allow the mouse to be used in neovim
    pumheight = 10,	 			            -- pop up menu height
    showmode = true,  		    	        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0, 	    		        -- always show tabs
    smartcase = true,  			            -- smart case
    smartindent = true, 			        -- make indenting smarter again
    guicursor = '', 
    splitbelow = true,	 		            -- force all horizontal splits to go below current window
    splitright = true, 			            -- force all vertical splits to go to the right of the current window
    swapfile = false, 			            -- creates a swapfile
    termguicolors = true,			        -- set term gui colors
    timeoutlen = 1000, 			            -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, 			            -- enable persistent undo
    updatetime = 300,			            -- faster completion
    writebackup = false, 			        -- if a file is being edited by another program
    expandtab = true, 			            -- convert tabs to spaces
    shiftwidth = 4,				            -- the number of spaces inserted for each indentation
    tabstop = 4,				            -- insert N spaces for a tab
    cursorline = true,			            -- highlight the current line
    number = true,				            -- set numbered lines
    relativenumber = false, 		        -- set relative numbered lines
    numberwidth = 4, 			            -- set number column width to 2 {default 4}
    signcolumn = "yes", 			        -- always show the sign column
    wrap = false,			    	        -- display lines as one long line
    scrolloff = 8,				            -- don't scroll too much
    sidescrolloff = 8,
    guifont = "monospace:h17",		        -- font
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
