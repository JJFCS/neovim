





-- instructions for setting up copilot in neovim
--		encompass GITHUB URL into plugin manager
--		execute :Copilot setup
--		login 2 NTU GITHUB & pass in OTP (FOUND IN MINIBUFFER)
--
--	COPILOT setup incomplete issues
--		Suggestions matching public code (duplication detection filter)
--		Set option "ALLOWED"






return {


	{ "github/copilot.vim" },
	{ "iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft  = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end
	},




}







