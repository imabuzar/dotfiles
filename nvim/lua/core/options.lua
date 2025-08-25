local opt = vim.opt
local fn = vim.fn

-- ============================================================================
-- Utility / ensure state directories exist (undodir, swapdir, backupdir)
-- ============================================================================
local state_path = fn.stdpath("state")

-- Undo directory (persistent undo)
local undodir = state_path .. "/undo"
if fn.isdirectory(undodir) == 0 then
	fn.mkdir(undodir, "p")
end
opt.undofile = true
opt.undodir = undodir

-- You can create backup/swap directories similarly if you want:
-- local backupdir = state_path .. "/backup"
-- if fn.isdirectory(backupdir) == 0 then fn.mkdir(backupdir, "p") end
-- opt.backup = true
-- opt.backupdir = backupdir
-- opt.swapfile = true
-- opt.swapfile = true

-- ============================================================================
-- Basic UI
-- ============================================================================
opt.mouse = "a" -- enable mouse support in all modes
opt.termguicolors = true -- true color support for modern terminals (required by many color schemes)
opt.background = "dark" -- "dark" or "light" (color-scheme hint)
opt.number = true -- show absolute line number
opt.relativenumber = true -- relative line numbers (nice for motions)
opt.cursorline = true -- highlight current line
opt.signcolumn = "yes" -- always show sign column (avoid text shifting)
-- opt.pumheight = 10 -- pop-up-menu height for completions
opt.laststatus = 3 -- global statusline (Neovim 0.7+)
opt.showmode = false -- don't show mode (if you use a statusline plugin)
opt.ruler = true -- show cursor position in statusline (redundant with some statusline plugins)
opt.cmdheight = 1 -- command-line height (set to 2 if you want more space for messages)
-- vim.o.winborder = "rounded"

-- ============================================================================
-- Searching
-- ============================================================================
opt.ignorecase = true -- case-insensitive search
opt.smartcase = true -- case-sensitive if search has uppercase
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- incremental search while typing

-- ============================================================================
-- Tabs / Indentation
-- ============================================================================
-- Global defaults (safe fallback for languages not explicitly configured)
opt.expandtab = true -- convert tabs to spaces
opt.tabstop = 4 -- how many columns a tab counts for
opt.shiftwidth = 4 -- size of an indent
opt.softtabstop = 4 -- edit as if tabs are this wide
opt.smartindent = true -- smart autoindenting on new lines
opt.autoindent = true -- copy indent from current line when starting a new line
-- If you prefer actual TAB characters (not spaces), comment out expandtab and set:
-- opt.expandtab = false
-- opt.shiftwidth = 4
-- opt.tabstop = 4
-- opt.softtabstop = 4

-- ============================================================================
-- File handling
-- ============================================================================
opt.fileencoding = "utf-8" -- file encoding written to disk
opt.encoding = "utf-8" -- internal encoding
opt.hidden = true -- keep buffers in background (allow switching without saving)
opt.swapfile = false -- disable swapfile (enable if you want crash recovery)
opt.backup = false -- disable backups (enable if you want backup files)
opt.writebackup = false -- don't keep a backup after successful write

-- ============================================================================
-- Performance / UX tweaks
-- ============================================================================
opt.updatetime = 300 -- faster completion / CursorHold (ms). Good for LSP & gitsigns
opt.timeoutlen = 500 -- time to wait for mapped sequence (ms)
opt.ttimeoutlen = 50 -- time to wait for key code sequences

-- ============================================================================
-- Completion / popups (recommended for nvim-cmp & LSP)
-- ============================================================================
opt.completeopt = { "menu", "menuone", "noselect" }
-- reduce messages during completion (avoid "pattern not found" spam)
opt.shortmess:append("c")

-- ============================================================================
-- Diagnostics display customization
-- ============================================================================
vim.diagnostic.config({
	virtual_text = true, -- Enable inline virtual text
	signs = true, -- Enable signs in the gutter
	underline = true, -- Enable underlining of affected text
	float = { border = "rounded" },
})

-- ============================================================================
-- Window splitting
-- ============================================================================
opt.splitright = true -- vertical splits to the right
opt.splitbelow = true -- horizontal splits below

-- ============================================================================
-- Wrapping / Scrolling
-- ============================================================================
opt.wrap = false -- don't wrap long lines
opt.linebreak = true -- wrap on word boundary
opt.scrolloff = 8 -- minimal lines to keep above/below cursor
opt.sidescrolloff = 8 -- same for side-scrolling

-- ============================================================================
-- Lists / Whitespace visualization (toggle with :set list / :set nolist)
-- ============================================================================
opt.list = false -- show invisible characters (false by default)
-- opt.listchars = { tab = '→ ', trail = '·', extends = '…', precedes = '…', nbsp = '␣' }
-- To enable: opt.list = true

-- ============================================================================
-- UI polish
-- ============================================================================
opt.fillchars = { eob = " " } -- hide ~ on the empty lines
opt.conceallevel = 0 -- keep concealed text visible (good for markdown)
opt.pumblend = 0 -- popup transparency (0..100)
-- If you like transparency for popup menus:
-- opt.pumblend = 10

-- ============================================================================
-- Clipboard
-- ============================================================================
opt.clipboard = "unnamedplus" -- use system clipboard (Linux: requires xclip/xsel or Wayland support)

-- ============================================================================
-- Spell / Language (optional)
-- ============================================================================
-- opt.spell = true
-- opt.spelllang = { "en_us" }

-- ============================================================================
-- Folds (many prefer treesitter-based folding or manual)
-- ============================================================================
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"  -- if using nvim-treesitter folding
-- opt.foldlevelstart = 99  -- start with all folds open

-- ============================================================================
-- Misc / safety
-- ============================================================================
-- opt.modeline = false          -- disable modelines for security (opt-in)
opt.iskeyword:append("-") -- consider words-with-dash as a single word (useful for a-b identifiers)

-- ============================================================================
-- Format options: prevent auto inserting comment leaders on new lines from o/O
-- ============================================================================
-- Remove 'o' from formatoptions so new lines don't continue comments automatically
vim.opt.formatoptions:remove("o")

-- ============================================================================
-- Final small helpers & notes
-- ============================================================================
-- Use :verbose set {option}? to see where an option was last set, e.g.
-- :verbose set number?
--
-- If you want to override these per-filetype, put those in
-- lua/after/ftplugin/<filetype>.lua or use autocommands in core.autocmds.lua
