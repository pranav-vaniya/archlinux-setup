#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1="\W > "
# ⮕ 🡒 → ⟶ ⇾ ➟ ➔ ➜ ➝ ➤ ➡ ➥
PS1="\[\033[0;32m\]\W ➟ \[\033[0m\]"
#PS1="\[\033[0;30m\]\W ➟ \[\033[0m\]"
#PS1="\[\033[0;32m\]\W \[\033[0m\]\[\033[0;33m\]➟\[\033[0m\] "

new_line_flag=0
function set_new_line() {
    if [ "$new_line_flag" -eq 1 ]; then
        echo "" # leave empty line
    else
        new_line_flag=1
    fi
}
PROMPT_COMMAND=set_new_line

# alias emerge="emerge --ask --verbose"
# alias update="sudo emerge --sync"
# alias upgrade="sudo emerge --ask --verbose --update --deep --newuse @world"
# alias uninstall="sudo emerge --deselect"
# alias autoremove="sudo emerge --verbose --depclean"
# alias cleanup="sudo eclean packages && sudo eclean distfiles"
# alias list-packages="bat /var/lib/portage/world"

alias install="sudo pacman -S "
alias uninstall="sudo pacman -R "
alias upgrade="sudo pacman -Syu"

alias free="free -m"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
# alias cat="bat"
# alias ls="eza --icons --sort type"
# alias lsc="clear && eza --icons --sort type"
# alias ll="eza --icons --sort type -l"
# alias llc="clear && eza --icons --sort type -l"
alias acpi="acpi | grep -oE '[0-9]+%' | cut -d '%' -f 1"
alias ping="ping -c 3 gentoo.org"
alias updatedb="sudo updatedb"
# alias py="/home/pranav/.config/python_venv/bin/python"
# alias pip="/home/pranav/.config/python_venv/bin/pip"
# alias python="/home/pranav/.config/python_venv/bin/python"
alias git-token="cat /home/pranav/Files/Git/token"
# alias rm="trash-put"
alias ristretto="ristretto ."

# VM ssh
# alias ssh-xfce="ssh tester@192.168.122.44"
# alias ssh-vm1="ssh tester@192.168.122.234"
# alias ssh-vm2="ssh tester@192.168.122.46"
# alias ssh-ubuntu="ssh tester@192.168.122.98"
# alias ssh-gentoo-min="ssh tester@192.168.122.26"
