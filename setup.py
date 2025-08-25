import os
import sys

# Define your configurations in configs.py
from configs import configs


def remove_symlink(path: str):
    try:
        if os.path.islink(path):
            os.remove(path)
        else:
            print(f"Error: Path '{path}' is not a symbolic link!")
    except OSError as e:
        print(f"Error removing path '{path}': {e}")


def list_configs():
    _ = os.system("clear")
    print("---------------------------------")
    print("     Listing Configurations      ")
    print("---------------------------------")

    for config in configs:
        config_name = config["name"]
        config_src = config["src"]
        config_dest = config["dest"]

        print(f"\n\n{config_name}")
        print("-" * len(config_name))
        print(f"Source: {config_src}")
        print(f"Destination: {config_dest}")

        if not os.path.exists(config_src):
            print("Status: Source path doesn't exist!")
            continue

        if os.path.islink(config_dest):
            actual_path = os.readlink(config_dest)
            if actual_path == config_src:
                print("Status: Correctly linked.")
            else:
                print(f"Status: Linked to a different source ({actual_path}).")
        elif os.path.exists(config_dest):
            print("Status: Destination exists but is not a symbolic link.")
            print("Manage it on your own.")
        else:
            print("Status: Not linked.")

    _ = input("\n\nPress enter to go back...")


def apply_configs():
    _ = os.system("clear")
    print("\n-------------------------------")
    print("    Applying Configurations    ")
    print("-------------------------------")

    for config in configs:
        config_name = config["name"]
        config_src = config["src"]
        config_dest = config["dest"]

        print(f"\n\n{config_name}")
        print("-" * len(config_name))

        if not os.path.exists(config_src):
            print("Skipped!")
            print(f"Source path '{config_src}' doesn't exist!")
            continue

        # Configurations exist but are not symlink
        if os.path.lexists(config_dest) and (not os.path.islink(config_dest)):
            print("Skipped!")
            print(f"'{config_dest}' already exists and is not a symbolic link.")
            print("Manage it on your own.")
            continue

        # symlink exists
        if os.path.islink(config_dest):
            print(f"A symbolic link already exist at '{config_dest}'")
            want_to_apply = input("Apply anyway by removing previous symlink? (y/n) ")
            if want_to_apply.lower() != "y":
                print("Skipped!")
                continue

            remove_symlink(config_dest)
            print(f"Removed '{config_dest}'")

        # Make sure all parent directories exist
        parent_directory = os.path.dirname(config_dest)
        os.makedirs(parent_directory, exist_ok=True)
        # Create symlink
        os.symlink(config_src, config_dest)
        print(f"Created symbolic link for '{config_src}' at '{config_dest}'")

    _ = input("\n\nPress enter to go back...")


def remove_configs():
    confirmation = None
    while True:
        _ = os.system("clear")
        print("\n-------------------------------")
        print("    Removing Configurations    ")
        print("-------------------------------")

        print(
            "\nNote: Configurations will be removed by removing any available symbolic links."
        )

        print("\n\n1. Remove all configurations without any confirmation")
        print("2. Remove configurations with confirmation")
        print("3. Go back")

        choice = input("\nEnter your choice (1, 2 or 3) --> ")

        if choice not in ["1", "2", "3"]:
            print("\nError: Invalid selection!")
            _ = input("Press enter to try again...")
            continue

        if choice == "3":
            return

        confirmation = choice == "2"
        break

    for config in configs:
        config_name = config["name"]
        config_src = config["src"]
        config_dest = config["dest"]

        print(f"\n\n{config_name}")
        print("-" * len(config_name))

        # Path doesn't exist
        if not os.path.lexists(config_dest):
            print("Skipped!")
            print(f"Symlink for '{config_src}' at '{config_dest}' doesn't exist!")
            continue

        # Path exists but not a symlink
        if not os.path.islink(config_dest):
            print("Skipped!")
            print(f"'{config_dest}' exists but is not a symbolic link.")
            print("Manage it on your own.")
            continue

        # Found a symlink
        print(f"Symbolic link found for '{config_src}' at '{config_dest}'")

        if confirmation:
            want_to_remove = input("Want to remove? (y/n): ")
            if want_to_remove.lower() != "y":
                print("Skipped!")
                continue

        remove_symlink(config_dest)
        print(f"Removed '{config_dest}'")

    _ = input("\n\nPress enter to go back...")


main_menu_str = """
--------------------------------
    Dotfiles Setup & Manager
--------------------------------

Manage your dotfiles with ease.
This script creates symbolic links to manage your
configurations, keeping them organized and version-controlled.


Following options are available:

1. List Configurations
2. Apply Configurations
3. Remove Configurations
4. Exit
"""


def main():
    while True:
        _ = os.system("clear")
        print(main_menu_str)

        choice = input("Enter your choice (1, 2, 3 or 4) --> ")

        if choice == "1":
            list_configs()
        elif choice == "2":
            apply_configs()
        elif choice == "3":
            remove_configs()
        elif choice == "4":
            print("\nExiting...")
            sys.exit(0)
        else:
            print("\nError: Invalid selection!")
            _ = input("Press enter to try again...")


if __name__ == "__main__":
    if sys.platform == "win32":
        print("Error: This setup script is not designed to run on Windows.")
        print("Please use a Linux or macOS environment (e.g., WSL on Windows).")
        sys.exit(1)

    # Now it is understood that script is running on unix-based os
    main()
