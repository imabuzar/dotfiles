return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>ws", "<cmd>SessionSearch<CR>", desc = "Session search" },
    { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
    { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
  },

  opts = {
    auto_restore = false,
    suppressed_dirs = { "~/", "~/Downloads", "/" },
  },
}
