return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>ws", "<cmd>AutoSession search<CR>", desc = "AutoSession: Search session" },
		{ "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "AutoSession: Restore last session" },
		{ "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "AutoSession: Toggle session autosave" },
	},

	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Downloads", "/" },
	},
}
