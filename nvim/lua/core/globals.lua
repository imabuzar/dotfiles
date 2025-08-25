-- lua/core/globals.lua
-- Global variables and very-early settings

-- =============================================================================
-- Leader Keys
-- =============================================================================
vim.g.mapleader = " " -- Space as leader
vim.g.maplocalleader = " " -- Local leader (often for project-specific maps)

-- =============================================================================
-- Plugin-related globals (examples)
-- =============================================================================
-- Some plugins rely on global variables before they load, e.g.:
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 -- disable netrw if you use nvim-tree or neo-tree

-- Tell plugins we have a nerd font (for icons)
vim.g.have_nerd_font = true

-- Enable format on save for LSP
vim.g.autoformat_enabled = true
