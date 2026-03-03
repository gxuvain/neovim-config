local servers = {
	"cssls",
	"docker_compose_language_service",
	"dockerls",
	"html",
	"jsonls",
	"lua_ls",
	"ruff",
	"tailwindcss",
	"ts_ls",
	"ocamllsp",
	"vue_ls",
	"biome",
	"eslint"
}

return {
	"https://github.com/neovim/nvim-lspconfig",
	dependencies = {
		{
			"https://github.com/mason-org/mason.nvim",
			config = function()
				require("mason").setup()
			end
		},
		{
			"https://github.com/mason-org/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					automatic_enable = false,
					ensure_installed = servers
				})
			end
		},
	},
	config = function()
		vim.lsp.enable(servers)
		vim.diagnostic.config({
			virtual_text = true
		})
	end
}
