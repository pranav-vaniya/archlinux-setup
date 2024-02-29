if [[ $- != *i* ]] ; then
	return
fi

# PS1="\W > "
PS1="\[\033[0;32m\]\W > \[\033[0m\]"

new_line_flag=0
function set_new_line() {
    if [ "$new_line_flag" -eq 1 ]; then
        echo "" # leave empty line
    else
        new_line_flag=1
    fi
}
PROMPT_COMMAND=set_new_line

alias emerge="emerge --ask --verbose"
alias update="sudo emerge --sync"
alias upgrade="sudo emerge --ask --verbose --update --deep --newuse @world"
alias uninstall="sudo emerge --deselect"
alias autoremove="sudo emerge --verbose --depclean"
alias cleanup="sudo eclean packages && sudo eclean distfiles"
alias list-packages="bat /var/lib/portage/world"

# alias install="sudo pacman -S "
# alias uninstall="sudo pacman -Rns "
# alias upgrade="sudo pacman -Syu"
# alias autoremove="sudo pacman -Rns $(pacman -Qtdq)"
# alias list-packages="pacman -Qen"

alias free="free -m"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias py="python3"
alias cat="bat"
alias ls="eza --icons --sort type"
alias lsc="clear && eza --icons --sort type"
alias ll="eza --icons --sort type -l"
alias llc="clear && eza --icons --sort type -l"
alias ping="ping -c 3 gentoo.org"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
alias code="vscode"
