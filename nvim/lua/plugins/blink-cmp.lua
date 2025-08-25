return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		{ "fang2hou/blink-copilot" }, -- GitHub Copilot source for blink.cmp
	},
	opts = {
		snippets = { preset = "luasnip" }, -- use LuaSnip with blink.cmp defaults
		keymap = {
			preset = "default",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		signature = { enabled = true, window = { border = "rounded" } },

		completion = {
			menu = {
				border = "rounded",
				-- nvim-cmp style menu
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},
				},
			},
			documentation = { auto_show = true, window = { border = "rounded" } },
			ghost_text = { enabled = true },
		},

		sources = {
			default = { "copilot", "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},

	opts_extend = { "sources.default" },
}
