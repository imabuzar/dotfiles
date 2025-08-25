return {
	"mason-org/mason.nvim",
	dependencies = {
		{
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},

	config = function()
		require("mason").setup({
			ui = {
				icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
			},
		})

		-- List LSPs here
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"ruff",
				"gopls",
				"clangd",
				"html",
				"cssls",
				"ts_ls",
			},
		})

		-- List Formatters and Linters here
		require("mason-tool-installer").setup({
			ensure_installed = { "prettierd", "stylua", "clang-format" },
		})
	end,
}
