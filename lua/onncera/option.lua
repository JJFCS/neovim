
NVIMUNDO = os.getenv("HOME") .. "/Downloads/nvim-undo"

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- See `:help 'list'` and `:help 'listchars'`
vim.opt.list           = true
vim.opt.listchars      = { tab = "» ", trail = "•", nbsp = "␣" }

vim.opt.incsearch      = true                   -- Search (incremental)
vim.opt.hlsearch       = true                   -- Search (highlight)

vim.opt.number         = true                   -- Enable          line numbers
vim.opt.relativenumber = true                   -- Enable relative line numbers

vim.opt.tabstop        = 4                      -- Number of spaces for tabs
vim.opt.softtabstop    = 4                      -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.shiftwidth     = 4                      -- Number of spaces for each step of (auto)indent

vim.opt.breakindent    = true                   -- Every wrapped line will continue visually indented (same amt. of space as the beginning of that line)
vim.opt.smartindent    = true                   -- Perform smart autoindenting   when starting a new line
vim.opt.autoindent     = true                   -- Copy indent from current line when starting a new line

vim.opt.smarttab       = true

vim.opt.undofile       = true                   -- Saves   undo history to an undo file when writing a buffer to a file
vim.opt.undodir        = NVIMUNDO               -- Setting undo directory
vim.opt.undolevels     = 5000                   -- Setting the maximum no. of changes that can be undone

vim.opt.ignorecase     = true                   -- Case-insensitive searching UNLESS \C
vim.opt.smartcase      = true                   -- or one or more capital letters in the search term

vim.opt.updatetime     = 250                    -- Reduce update time
vim.opt.timeoutlen     = 5000                   -- Rise in time to complete your keybind combination (default == 1000)


vim.opt.colorcolumn    = "80"                   -- Reference to not write code longer than 80 characters
vim.opt.scrolloff      =  10                    -- Screen lines (minimum amount) to keep above and below the cursor
vim.opt.signcolumn = "yes"
vim.opt.guicursor  = ""
vim.opt.wrap = false


----------------------------------------------------------------------------------------------------


-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner       = 0
-- vim.g.netrw_winsize      = 25

