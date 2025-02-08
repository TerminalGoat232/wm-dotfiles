if status is-interactive
    # Commands to run in interactive sessions can go here
    
end
set -g fish_greeting
#nitch
#neofetch --ascii ascii
#treefetch --bonsai 
starship init fish | source

thefuck --alias | source

alias :3=echo
alias nomnom=killall
alias nv=nvim
alias update='yay'
alias pacstat='yay -Ps'
alias ccache='sudo rm -rf /var/cache/pacman/pkg/*'
alias clock='tty-clock -s -c 1'
alias neofetch='neofetch --ascii_distro arch_small'
alias cya=reboot
alias kys='shutdown now'
alias kleww='killall eww'
alias qa='killall'
alias rmpkg='yay -Rns'
alias aged='./arch-age'
alias c='clear'
alias cd='cd | ls'
alias pwdcp='pwd | tr -d "\n" | xclip -sel c'
alias ...="cd ../.."
set PATH "/home/terminalgoat/.local/bin:$PATH"
