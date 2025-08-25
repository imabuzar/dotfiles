from os import path

# Get absolute path of dotfiles directory by expanding ~/
DOTFILES_PATH = path.expanduser("~/dotfiles")


# List of configurations to manage
configs = [
    {
        "name": "Neovim",
        "src": path.join(DOTFILES_PATH, "nvim"),
        "dest": path.expanduser("~/.config/nvim"),
    },
    {
        "name": "Alacritty",
        "src": path.join(DOTFILES_PATH, "alacritty"),
        "dest": path.expanduser("~/.config/alacritty"),
    },
    {
        "name": "clang-format",
        "src": path.join(DOTFILES_PATH, ".clang-format"),
        "dest": path.expanduser("~/.clang-format"),
    },
]
