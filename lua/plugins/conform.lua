return {
	"https://github.com/stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			fomatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" }
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end
}
