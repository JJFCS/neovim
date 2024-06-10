-- Onncera's personal remaps
--
--
--		Set <space> as the leader key
--		See `:help mapleader`
--		NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader      = " "
vim.g.maplocalleader = ","



-- [[ Basic Keymaps ]]
--    See `:help vim.keymap.set()`
--
--
vim.keymap.set("i", "kk",    "<Esc>")        -- remap `kk' == `ESC'
vim.keymap.set("i", "jj",    "<Esc>:w<CR>")  -- remap `jj' == `ESC'
vim.keymap.set("n", "<Tab>", "$")            -- remap `TAB' == JUMP TO EOL
vim.keymap.set("v", "<Tab>", "$")            -- remap `TAB' == JUMP TO EOL


-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")



-- [[ Basic Autocommands ]]
--    See `:help lua-guide-autocommands`

-- Yanking (copying) text will show highlights
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc     = "Highlight when yanking (copying) text",
	group    = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})



