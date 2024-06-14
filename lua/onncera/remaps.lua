
vim.g.mapleader      = " "
vim.g.maplocalleader = ","


vim.keymap.set("i", "jk", "<Esc>")  -- remap `jk' == <Esc>
vim.keymap.set("i", "kj", "<Esc>")  -- remap `kj' == <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")  -- clear HIGHLIGHT on pressing <Esc> in normal mode


vim.keymap.set("i", "<C-f>", "<Right>"  )  -- move one character
vim.keymap.set("i", "<C-b>", "<Left>"   )  -- move one character (backward)
vim.keymap.set("i", "<C-n>", "<Down>"   )  -- move one character (down)
vim.keymap.set("i", "<C-p>", "<Up>"     )  -- move one character (up)
vim.keymap.set("i", "<C-d>", "<Del>"    )  -- kill one character (forward) (backspace 4 one character kill backward)

vim.keymap.set("i", "<M-f>", "<C-Right>")  -- move by word
vim.keymap.set("i", "<M-b>", "<C-Left>" )  -- move by word (backward)
vim.keymap.set("i", "<C-w>", "<C-o>db"  )  -- kill by word (backward)
vim.keymap.set("i", "<M-d>", "<C-o>dw"  )  -- kill by word

vim.keymap.set("i", "<C-a>", "<Home>"   )  -- move 2 line (beginning)
vim.keymap.set("i", "<C-e>", "<End>"    )  -- move 2 line (end)

vim.keymap.set("i", "<C-u>", "<C-o>d0"  )  -- kill 2 line (beginning)
vim.keymap.set("i", "<C-k>", "<C-o>D"   )  -- kill 2 line (end)

vim.keymap.set("i", "<C-y>", '<C-r>"'   )  -- kill ring (yank / paste)



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

