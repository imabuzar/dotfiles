return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				signs_staged = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				attach_to_untracked = false,
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 200,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},

				on_attach = function(bufnr)
					local function map(mode, lhs, rhs, desc)
						local opts = { silent = true, noremap = true, buffer = bufnr, desc = "GitSigns: " .. desc }
						vim.keymap.set(mode, lhs, rhs, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end, "Next hunk")

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end, "Previous hunk")

					-- Actions
					map("n", "<leader>hs", gitsigns.stage_hunk, "Stage hunk")
					map("n", "<leader>hr", gitsigns.reset_hunk, "Reset hunk")

					map("v", "<leader>hs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "Stage selection")

					map("v", "<leader>hr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "Reset selection")

					map("n", "<leader>hS", gitsigns.stage_buffer, "Stage buffer")
					map("n", "<leader>hR", gitsigns.reset_buffer, "Reset buffer")
					map("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
					map("n", "<leader>hi", gitsigns.preview_hunk_inline, "Preview hunk inline")
					map("n", "<leader>hb", function()
						gitsigns.blame_line({ full = true })
					end, "Blame line (full)")

					map("n", "<leader>hd", gitsigns.diffthis, "Diff against index")
					map("n", "<leader>hD", function()
						gitsigns.diffthis("~")
					end, "Diff against last commit")

					map("n", "<leader>hQ", function()
						gitsigns.setqflist("all")
					end, "Populate quickfix (all hunks)")

					map("n", "<leader>hq", gitsigns.setqflist, "Populate quickfix (current file)")

					-- Toggles
					map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle line blame")
					map("n", "<leader>tw", gitsigns.toggle_word_diff, "Toggle word diff")

					-- Text object
					map({ "o", "x" }, "ih", gitsigns.select_hunk, "Select hunk")
				end,
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local function map(mode, lhs, rhs, desc)
				local opts = { silent = true, noremap = true, desc = desc }
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			map("n", "<leader>gt", "<cmd>Neogit kind=tab<CR>", "Neogit open in tab")
			map("n", "<leader>gf", "<cmd>Neogit kind=floating<CR>", "Neogit open floating window")
		end,
	},
	{
		"tpope/vim-fugitive",
	},
}
