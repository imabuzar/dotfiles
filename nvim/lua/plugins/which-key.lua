return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- configuration comes here
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
