return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>ws", "<cmd>AutoSession search<CR>", desc = "Session search" },
		{ "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
		{ "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
	},

	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Downloads", "/" },
	},
}
