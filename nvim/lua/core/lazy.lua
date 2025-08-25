-- Setup lazy plugin manager

-- Define the path where lazy.nvim will be stored
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo =
    "https://github.com/folke/lazy.nvim.git"                                                                   -- git repo for lazy
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }) -- Clone repo

    -- Check if the git clone command failed
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- Add lazy.nvim to Neovim’s runtime path
vim.opt.rtp:prepend(lazypath)


-- Setup plugins
require("lazy").setup("plugins", {
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        notify = false, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false, -- get a notification when changes are found
    },
})
