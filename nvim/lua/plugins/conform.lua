return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({

			formatters_by_ft = {
				-- Lua
				lua = { "stylua" },

				-- Python
				python = {
					"ruff_fix", -- To fix auto-fixable lint errors.
					"ruff_format", -- To run the Ruff formatter.
					"ruff_organize_imports", -- To organize the imports.
				},

				-- C/C++
				c = { "clang_format" },
				cpp = { "clang_format" },

				-- JS/TS (prefer prettierd, fallback to prettier)
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				vue = { "prettierd", "prettier", stop_after_first = true },

				-- Web formats
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
			},

			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
				async = false,
			},
		})

		-- Keymaping for file format
		vim.keymap.set("n", "<leader>bf", function()
			require("conform").format()
		end, { desc = "Format Buffer" })
	end,
}
