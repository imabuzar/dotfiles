-- Make nvim window separators colorful
return {
	"nvim-zh/colorful-winsep.nvim",
	event = { "WinLeave" },
	config = function()
		require("colorful-winsep").setup({
			border = "rounded",
		})
	end,
}
