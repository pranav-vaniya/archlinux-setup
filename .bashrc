# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1="\W > "
#PS1='\[\e[32m\]\W > \[\e[0m\]'
PS1='\[\e[1;32m\]\W > \[\e[0m\]'

# PS1='\[\e[1;31m\](root) \w > \[\e[0m\]' # For root

FIRST_COMMAND=true
update_prompt_command() {
    if [ "$FIRST_COMMAND" = false ]; then
        echo ""
    else
        FIRST_COMMAND=false
    fi
}
PROMPT_COMMAND=update_prompt_command

# alias emerge="emerge -av"
# alias list-packages="cat /var/lib/portage/world"
# alias update="emerge -av --sync"
# alias upgrade="emerge -av --update --deep --changed-use @world"
# alias uninstall="emerge -av --deselect"
# alias autoremove="emerge -av --depclean"

# alias install="sudo pacman -S "
# alias uninstall="sudo pacman -Rns "
# alias autoremove="sudo pacman -Rns $(pacman -Qtdq)"
# alias list-packages="pacman -Qen | bat"
# alias upgrade="sudo pacman -Syu"
# alias update-mirrors='curl -s "https://archlinux.org/mirrorlist/?country=IN&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on" | sed -e "s/^#Server/Server/" -e "/^#/d" | rankmirrors -n 5 - > /home/pranav/.config/mirrors-temp && sudo mv /home/pranav/.config/mirrors-temp /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist'
# alias bluetooth="sudo systemctl start bluetooth && blueman-manager"

# alias ls="eza --icons --sort type"
# alias ll="eza -l --icons --sort type"
# alias cat="bat"
alias free="free -m"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias py="python3"
alias grep="grep --color=auto"
alias ping="ping -c 3 archlinux.org"
