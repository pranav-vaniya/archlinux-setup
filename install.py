# this script will install the dotfiles in the current user profile

import os
import subprocess
import shutil
from pathlib import Path

SUCCESS_M = "\033[32m  SUCC  \033[0m"  # green
INFO_M = "\033[34m  INFO  \033[0m"  # blue
WARN_M = "\033[33m  WARN  \033[0m"  # yellow
DANGER_M = "\033[31m DANGER \033[0m"  # red
QUESTION_M = "\033[35m  QUES  \033[0m"  # purple

print(f"{INFO_M} Starting installation")

CURR_DIR = Path(__file__).parent
contents_dir = CURR_DIR / "contents"


def copy_bashrc() -> None:
    source = contents_dir / "bashrc"
    destination = os.path.expanduser("~/.bashrc")
    backup = destination + ".backup"

    if os.path.exists(destination):
        backup = destination + ".backup"

        # delete old backup
        if os.path.exists(backup):
            os.remove(backup)
            print(f"{INFO_M} Deleted {backup}")

        # move ~/.bashrc to ~/.bashrc.backup
        os.rename(destination, backup)
        print(f"{INFO_M} Moved {destination} to {backup}")

    # copy bashrc to ~/.bashrc
    shutil.copyfile(source, destination)
    print(f"{SUCCESS_M} Copied {source} to {destination}")


def copy_configs() -> None:
    config_dirs = os.listdir(contents_dir / "config")

    for dir in config_dirs:
        source = contents_dir / "config" / dir
        destination = os.path.expanduser("~/.config/" + dir)

        if os.path.exists(destination):
            backup = destination + ".backup"

            # delete old backup
            if os.path.exists(backup):
                shutil.rmtree(backup)
                print(f"{INFO_M} Deleted {backup}")

            # move ~/.config/folder to ~/.config/folder.backup
            os.rename(destination, backup)
            print(f"{INFO_M} Moved {destination} to {backup}")

        # copy item to ~/.config/item
        shutil.copytree(source, destination)
        print(f"{SUCCESS_M} Copied {source} to {destination}")


def copy_home_dirs() -> None:
    home_dirs = os.listdir(contents_dir / "copy_to_home")

    for dir in home_dirs:
        source = contents_dir / "copy_to_home" / dir
        destination = os.path.expanduser("~/." + dir)  # prefix '.' to the folder name

        if os.path.exists(destination):
            backup = destination + ".backup"

            # delete old backup
            if os.path.exists(backup):
                shutil.rmtree(backup)
                print(f"{INFO_M} Deleted {backup}")

            # move ~/folder to ~/folder.backup
            os.rename(destination, backup)
            print(f"{INFO_M} Moved {destination} to {backup}")

        # copy item to ~/item
        shutil.copytree(source, destination)
        print(f"{SUCCESS_M} Copied {source} to {destination}")


def install_pacman_packages() -> None:
    package_file = contents_dir / "package_list.txt"

    if os.path.exists(package_file):
        with open(package_file, "r") as pacfile:
            package_list = pacfile.read().splitlines()
            package_list = [filename.strip() for filename in package_list]

            installation_command = ["sudo", "pacman", "-S"] + package_list

            try:
                print(
                    f"{INFO_M} Starting installation of packages:",
                    ", ".join(package_list),
                )
                subprocess.run(installation_command, check=True)
                print(f"{INFO_M} Installed all packages successfully!")

            except:
                print(
                    f"{DANGER_M} Error occurred while trying to install the packages. Please try manually."
                )

    else:
        print(f"{DANGER_M} Could not find package_list.txt")


def install_yay_packages() -> None:
    package_file = contents_dir / "aur_package_list.txt"

    if os.path.exists(package_file):
        with open(package_file, "r") as pacfile:
            package_list = pacfile.read().splitlines()
            package_list = [filename.strip() for filename in package_list]

            installation_command = ["yay", "-S"] + package_list

            try:
                print(
                    f"{INFO_M} Starting installation of packages:",
                    ", ".join(package_list),
                )
                subprocess.run(installation_command, check=True)
                print(f"{INFO_M} Installed all packages successfully!")

            except:
                print(
                    f"{DANGER_M} Error occurred while trying to install the packages. Please try manually."
                )

    else:
        print(f"{DANGER_M} Could not find package_list.txt")


# for any linux system
copy_bashrc()
copy_configs()
copy_home_dirs()

# only for ARCH linux and ARCH linux based systems
install_pacman_packages()
install_yay_packages()

print(f"{SUCCESS_M} Finished installation")
