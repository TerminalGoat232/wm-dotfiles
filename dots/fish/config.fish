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
alias ff='fastfetch'
alias add_kernel='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias cya=reboot
alias kys='shutdown now'
alias kleww='killall eww'
alias qa='killall'
alias rmpkg='yay -Rns'
alias aged='./arch-age'
alias c='clear'
alias pwdcp='pwd | tr -d "\n" | xclip -sel c'
alias ...="cd ../.."
set PATH "/home/terminalgoat/.local/bin:$PATH"

function cs --argument dir
    if [ "dir" = "" ]
        builtin cd $HOME
    else
        builtin cd $dir
    end
    ls -a
end
