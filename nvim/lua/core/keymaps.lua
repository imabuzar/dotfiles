-- Helper function to set keymaps
local function map(mode, lhs, rhs, desc)
	local opts = { silent = true, noremap = true, desc = desc }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- =============================================================================
-- General Keymaps
-- =============================================================================

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlights")

-- Exit insert mode
map("i", "jj", "<ESC>", "Exit insert mode")

-- Save with Ctrl+s
map("n", "<C-s>", "<cmd>w<CR><Esc>", "Save file")

-- Quit with Ctrl+q
map("n", "<C-q>", "<cmd>q<CR>", "Quit Neovim")

-- ============================================================================
-- Indentation
-- =============================================================================
-- Stay in visual mode after indentation
-- the 'gv' command is used to reselect the last visually selected area.
map("v", "<", "<gv", "Indent left and reselect")
map("v", ">", ">gv", "Indent right and reselect")
map("v", "=", "=gv", "Auto-indent and reselect")

-- ============================================================================
-- Window splits
-- =============================================================================
-- Splits
map("n", "<leader>sh", "<cmd>split<CR>", "New horizontal split")
map("n", "<leader>sv", "<cmd>vsplit<CR>", "New vertical split")
map("n", "<leader>se", "<C-w>=", "Equalize split sizes")
map("n", "<leader>sc", "<cmd>close<CR>", "Close current split/window")

-- Navigate between splits
map("n", "<C-k>", "<cmd>wincmd k<CR>", "Move to split above")
map("n", "<C-j>", "<cmd>wincmd j<CR>", "Move to split below")
map("n", "<C-h>", "<cmd>wincmd h<CR>", "Move to split left")
map("n", "<C-l>", "<cmd>wincmd l<CR>", "Move to split right")

-- =============================================================================
-- Tabs
-- =============================================================================
-- NOTE: Disabled in favor of terminal bindings (Uncomment following if want to use)

-- map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab", silent = true }) -- open new tab
-- map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab", silent = true }) -- close tab
-- map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab", silent = true }) -- next tab
-- map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab", silent = true }) -- previous tab

-- =============================================================================
-- Terminals
-- =============================================================================
map("n", "<leader>tt", "<cmd>terminal<CR>", "Open new terminal as a new buffer")
map("n", "<leader>th", "<cmd>split | terminal<CR>", "Open new terminal in horizontal split")
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", "Open new terminal in vertical split")
map("t", "<ESC>", "<C-\\><C-n>", "Return to Normal mode from terminal")
map({ "n", "t" }, "<leader>tc", "<cmd>bdelete!<CR>", "Close terminal")

-- =============================================================================
-- Buffers
-- =============================================================================
-- NOTE: Disabled some keymaps in favor of bufferline

-- map("n", "<leader>bn", "<cmd>bnext<CR>", "Go to next buffer")
-- map("n", "<leader>bp", "<cmd>bprevious<CR>", "Go to previous buffer")
map("n", "<leader>br", "<cmd>edit!<CR>", "Reload current buffer")
map("n", "<leader>x", "<cmd>bdelete<CR>", "Close current buffer")
map("n", "<leader>bc", "<cmd>bdelete<CR>", "Close current buffer")
map("n", "<leader>ba", "<cmd>%bdelete<CR>", "Close all buffers")
map("n", "<leader>bo", "<cmd>%bdelete|edit#|bdelete#<CR>", "Close all buffers except current one")

-- =============================================================================
-- LSP
-- =============================================================================
map("n", "<leader>ih", function()
	local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	if is_enabled then
		vim.lsp.inlay_hint.enable(false, { bufnr = 0 })
		vim.notify("Disabled LSP Inlay Hints", vim.log.levels.INFO)
	else
		vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
		vim.notify("Enabled LSP Inlay Hints", vim.log.levels.INFO)
	end
end, "LSP: Toggle inlay hints (current buffer)")

-- =============================================================================
-- Quickfix / Location List
-- =============================================================================
map("n", "<leader>co", "<cmd>copen<CR>", "Open quickfix list")
map("n", "<leader>cc", "<cmd>cclose<CR>", "Close quickfix list")
map("n", "<leader>lo", "<cmd>lopen<CR>", "Open location list")
map("n", "<leader>lc", "<cmd>lclose<CR>", "Close location list")

-- =============================================================================
-- Resize splits with arrows
-- =============================================================================
map("n", "<C-Up>", ":resize -2<CR>", "Decrease split height")
map("n", "<C-Down>", ":resize +2<CR>", "Increase split height")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Decrease split width")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Increase split width")
