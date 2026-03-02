-- Options
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.winborder = "rounded"

-- Keymaps
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")

-- Plugins
vim.pack.add {
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/metalelf0/black-metal-theme-neovim",
}

-- Lsp
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
vim.lsp.enable(servers)

-- Plugins configs
require("oil").setup {
	columns = { "size", "mtime" },
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
}
require("mini.pick").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	automatic_enable = false,
	ensure_installed = servers
})
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		['<S-Tab>'] = { 'select_prev', 'fallback' },
		['<Tab>'] = { 'select_next', 'fallback' },
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		}
	}
})
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
require("nvim-autopairs").setup()
require("black-metal").setup({
	theme = "gorgoroth"
})
require("black-metal").load()

-- Display diagnostics
vim.diagnostic.config({
	virtual_text = true
})

-- Utils functions
require("utils")
