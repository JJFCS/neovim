return {

	"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },  -- NOTE: must be loaded before dependants
			  "williamboman/mason-lspconfig.nvim",
			  "WhoIsSethDaniel/mason-tool-installer.nvim",
			  "hrsh7th/cmp-buffer",
			  "hrsh7th/cmp-cmdline",
			  "hrsh7th/cmp-nvim-lsp",
			  "hrsh7th/cmp-path",
			  "hrsh7th/nvim-cmp",
			  "L3MON4D3/LuaSnip",
			  "saadparwaiz1/cmp_luasnip",
			  "j-hui/fidget.nvim",
		},


		config = function()
			require("fidget").setup({})
			local cmp_lsp      = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)


			local servers = {
				clangd = {filetypes = { "c", "cpp" }},
				lua_ls = {
					settings = {
						Lua  = {
							completion  = {callSnippet = "Replace"},
							diagnostics = {globals     = { "vim" }},
						},
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})


			require("mason").setup()
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- Handles overriding only values explicitly passed by the server configuration above.
						-- Helpful when disabling certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end
				},
			})


			vim.api.nvim_create_autocmd('LspAttach', {
				group    = vim.api.nvim_create_augroup("onncera-lsp-attach", {}),
				callback = function(event)

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end


					local client = vim.lsp.get_client_by_id(event.data.client_id)  -- stores the current LSP event client ID in a variable
					-- Following autocommand is used to enable inlay hints in your code if the language server you are using supports them
					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
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


			vim.api.nvim_create_autocmd("LspDetach", {
				group    = vim.api.nvim_create_augroup("onncera-lsp-detach", { clear = true }),
				callback = function() vim.lsp.buf.clear_references() end
			})


		end

}

