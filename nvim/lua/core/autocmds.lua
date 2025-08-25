local autocmd = vim.api.nvim_create_autocmd

-- Set LSP keymaps
autocmd("LspAttach", {
	callback = function(args)
		local map = function(mode, lhs, rhs, desc)
			local opts = { silent = true, noremap = true, buffer = args.buf, desc = desc }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		local builtin = require("telescope.builtin")

		-- Set custom keymaps
		map("n", "gd", builtin.lsp_definitions, "Go to Definition (Telescope)")
		map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
		map("n", "gr", builtin.lsp_references, "References (Telescope)")
		map("n", "gi", builtin.lsp_implementations, "Implementations (Telescope)")
		map("n", "gt", builtin.lsp_type_definitions, "Type Definitions (Telescope)")

		map("n", "<F2>", vim.lsp.buf.rename, "Rename Symbol")
		map({ "n", "v" }, "<F4>", vim.lsp.buf.code_action, "Code Action")
		map("n", "gl", vim.diagnostic.open_float, "Line Diagnostics")
		map("n", "gs", function()
			vim.lsp.buf.signature_help({ border = "rounded" })
		end, "Signature Help")

		-- Add borders to LSP Hover
		map("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, "LSP Hover")
	end,
})

-- Enable auto format on file save
autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Disable hover capability from Ruff, allows Pyright for docs
autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "ruff" then
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})

-- Enable inlay hints for supported LSP
autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})
