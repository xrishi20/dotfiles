eval "$(starship init zsh)"

alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"
alias jctl="journalctl -p 3 -xb"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias ll="exa -l --color=always --group-directories-first --icons"

source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
