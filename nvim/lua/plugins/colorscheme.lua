-- NOTE: Uncomment colorscheme you want to use

return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night", -- moon, storm, night, day
	-- 			transparent = false,
	-- 		})
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },

	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "darker",
	-- 			transparent = false,
	-- 		})
	-- 		require("onedark").load() -- Enable theme
	-- 	end,
	-- },

	-- {
	-- 	"sainnhe/sonokai",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.sonokai_style = "default" -- default, atlantis, andromeda, shusia, maia, espresso
	-- 		vim.g.sonokai_transparent_background = 0 -- 0 (No transparent), 1 (Transparent background), 2 (Transparent background + ui components)
	-- 		vim.g.sonokai_enable_italic = true
	-- 		vim.g.sonokai_diagnostic_text_highlight = false
	-- 		vim.cmd.colorscheme("sonokai")
	-- 	end,
	-- },

	-- {
	-- 	"sainnhe/edge",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.edge_enable_italic = true
	-- 		vim.g.edge_style = "aura" -- 'default', 'aura', 'neon'
	-- 		vim.g.edge_transparent_background = false
	-- 		vim.g.edge_diagnostic_virtual_text = "colored"
	-- 		vim.g.edge_inlay_hints_background = "none" -- 'none', 'dimmed'
	-- 		vim.cmd.colorscheme("edge")
	-- 	end,
	-- },
}
