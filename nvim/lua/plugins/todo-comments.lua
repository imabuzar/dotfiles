return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    local map = vim.keymap.set

    map("n", "]t", function() todo_comments.jump_next() end, { desc = "Next todo comment" })
    map("n", "[t", function() todo_comments.jump_prev() end, { desc = "Previous todo comment" })

    -- Search through all project todos with Telescope
    map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Telescope find todos" })

    todo_comments.setup()
  end
}
