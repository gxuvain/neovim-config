return {
	"https://github.com/Saghen/blink.cmp",
	config = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "enter",
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				}
			}
		})
	end
}
