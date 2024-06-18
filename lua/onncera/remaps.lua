
local autocmd = vim.api.nvim_create_autocmd



vim.g.mapleader      = " "
vim.g.maplocalleader = ","



-- GENERAL
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Primeagen: relocating items in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Primeagen: relocating items in visual mode" })

vim.keymap.set("n", "<leader>y", [["+y]] , { desc = "Primeagen: yank into system's clipboard" })
vim.keymap.set("v", "<leader>y", [["+y]] , { desc = "Primeagen: yank into system's clipboard" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Primeagen: retain 'paste' buffer" })

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Primeagen: 1/2 page jumping, keep cursor center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Primeagen: 1/2 page jumping, keep cursor center" })



-- PLUGINS
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>",                { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<CR>",                 { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sc", "<cmd>Telescope commands<CR>",                  { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>",               { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<CR>",                 { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<CR>",                 { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>",                   { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<CR>",               { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope live grep" })


vim.keymap.set("n", "<leader>l", function() require('lint').try_lint() end, { desc = "[L]int" })  -- LINTER
vim.keymap.set("n", '<leader>ut', "<cmd>UndotreeToggle<CR>", { desc = "[U]ndo   [T]ree" })  -- UT


autocmd('LspAttach', {
	group    = vim.api.nvim_create_augroup("onncera-lsp-attach", {}),
	callback = function(event)

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)  -- stores the current LSP event client ID in a variable
		-- Following autocommand is used to enable inlay hints in your code if the language server you are using supports them
		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end


		map("K", vim.lsp.buf.hover, "Hover Documentation")

		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("gr", require("telescope.builtin").lsp_references,  "[G]oto [R]eferences")

		map("<leader>ds", require("telescope.builtin").lsp_document_symbols,          "[D]ocument  [S]ymbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>ca", vim.lsp.buf.code_action,                                    "[C]ode [A]ction"      )
		map("<leader>rn", vim.lsp.buf.rename,                                         "[R]e[n]ame"           )

		map("[d", vim.diagnostic.goto_prev, "Jump to the previous diagnostic")
		map("]d", vim.diagnostic.goto_next, "Jump to the next diagnostic")

	end
})



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

