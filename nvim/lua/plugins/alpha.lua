return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Menu
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert<CR>"),
			dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("e", "  File explorer", "<cmd>Neotree toggle<CR>"),
			dashboard.button("s", "  Restore last session", "<cmd>AutoSession restore<CR>"),
			dashboard.button("S", "  Search sessions", "<cmd>AutoSession search<CR>"),
			dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
		}

		-- Footer
		dashboard.section.footer.val = "⚡ Neovim loaded successfully!"

		-- Final setup
		alpha.setup(dashboard.config)
	end,
}
