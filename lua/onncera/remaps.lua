
vim.g.mapleader      = " "
vim.g.maplocalleader = ","


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")         -- relocating items in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")         -- relocating items in visual mode

vim.keymap.set("i", "jk", "<Esc>")                   -- remap `jk' == <Esc>
vim.keymap.set("i", "kj", "<Esc>")                   -- remap `kj' == <Esc>

vim.keymap.set("n", "<C-d>", "<C-d>zz")              -- 1/2 page jumping while keeping cursor in the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")              -- 1/2 page jumping while keeping cursor in the middle

vim.keymap.set("x", "<leader>p", [["_dP]])           -- good remap for not losing 'paste' buffer (Primeagen)
vim.keymap.set("n", "<leader>y", [["+y]])            -- yank into system's clipboard (normal mode)
vim.keymap.set("v", "<leader>y", [["+y]])            -- yank into system's clipboard (visual mode)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")  -- clear HIGHLIGHT on pressing <Esc> in normal mode



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

