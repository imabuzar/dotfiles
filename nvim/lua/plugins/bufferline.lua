return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				offsets = {
					{ filetype = "neo-tree", text = "Neotree", text_align = "center", separator = true },
				},
			},
		})

		-- Next / Previous buffer mappings
		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
	end,
}
