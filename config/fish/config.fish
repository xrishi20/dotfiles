if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias jctl="journalctl -p 3 -xb"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

set -g fish_greeting 
