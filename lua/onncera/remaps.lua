
vim.g.mapleader      = " "
vim.g.maplocalleader = ","

vim.keymap.set("i", "jk", "<Esc>")  -- remap `jk' == <Esc>
vim.keymap.set("i", "kj", "<Esc>")  -- remap `kj' == <Esc>

vim.opt.hlsearch = true                              -- HIGHLIGHT on search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")  -- HIGHLIGHT on pressing <Esc> in normal mode


-- [[ Basic Autocommands ]]
--    See `:help lua-guide-autocommands`
--
-- Copying shows HIGHLIGHTS
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc     = "Highlight when yanking (copying) text",
	group    = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

