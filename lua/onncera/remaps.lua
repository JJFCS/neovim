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
vim.keymap.set("i", "jk",    "<Esc>")  -- remap `jk' == `ESC'
vim.keymap.set("i", "kj",    "<Esc>")  -- remap `kj' == `ESC'


-- emacs's like keybinding for insert mode navigation
vim.keymap.set("i", "<C-b>", "<Left>",  { desc = "move left"              })
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "move right"             })
vim.keymap.set("i", "<C-n>", "<Down>",  { desc = "move down"              })
vim.keymap.set("i", "<C-p>", "<Up>",    { desc = "move up"                })

vim.keymap.set("i", "<C-a>", "<ESC>^i", { desc = "move beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>",   { desc = "move end of line"       })



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



