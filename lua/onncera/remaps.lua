
vim.g.mapleader      = " "
vim.g.maplocalleader = ","


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Primeagen: relocating items in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Primeagen: relocating items in visual mode" })

vim.keymap.set("n", "<leader>y", [["+y]] , { desc = "Primeagen: yank into system's clipboard" })
vim.keymap.set("v", "<leader>y", [["+y]] , { desc = "Primeagen: yank into system's clipboard" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Primeagen: retain 'paste' buffer" })

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", '<leader>ut', "<cmd>UndotreeToggle<CR>", { desc = "[U]ndo   [T]ree" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Primeagen: 1/2 page jumping, keep cursor center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Primeagen: 1/2 page jumping, keep cursor center" })


vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")


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

