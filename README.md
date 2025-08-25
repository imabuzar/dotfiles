# Dotfiles

This repository contains my personal configuration files (**dotfiles**) for tools like Neovim, Alacritty, and others.  
All configs are stored here and symlinked into the proper locations on the system for easy management and version control.

---

## Features

- Keep your configs organized in one place (`~/dotfiles`)
- Apply or remove configs using symbolic links
- Safe: existing configs are never overwritten unless they are symlinks
- Simple `setup.py` script for automation

---

## Setup

Clone the repo into your home directory:

```bash
git clone https://github.com/imabuzar/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run the setup script:

```bash
python3 setup.py
```

---

## Notes

- This setup script is designed for Linux/macOS.
- Windows is not supported (unless using WSL).
- Before applying, make sure your `~/dotfiles` contains the config folders (e.g. `nvim`, `alacritty`).

---
