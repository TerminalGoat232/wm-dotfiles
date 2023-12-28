if status is-interactive
    # Commands to run in interactive sessions can go here
    
end
set -g fish_greeting
#nitch
#neofetch --ascii ascii
treefetch --bonsai 
starship init fish | source

thefuck --alias | source

alias :3=echo
alias nomnom=killall
alias nv=nvim
alias update='yay -Syu'
alias clock='tty-clock -s -c 1'
alias neofetch='neofetch --ascii ascii'
alias cya=reboot
alias kys='shutdown now'
alias kleww='killall eww'
alias qa='killall'
alias rmpkg='yay -Rns'
alias aged='./arch-age'
