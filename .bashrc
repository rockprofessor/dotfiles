# .bashrc
alias v='vim'
alias p='python'
alias m='neomutt'
alias n='nchat'
alias s='~/scripts/launchspt.sh'
alias c='calcure'
alias sdn='shutdown -h now'
alias tt='tt -nohighlight -words ~/tt/words/german10000'
alias a='abook'
alias w='wikit'
alias aoc='aocli'
alias rosi='echo "Rosi ist die Beste!"'
alias basti='echo "Basti ist der Geschickteste!"'

export PATH="/home/robert/.vim/bundle/vim-live-latex-preview/bin:$PATH"
export PATH="/home/robert/.cargo/bin:$PATH"
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
set -o vi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval "$(zoxide init --cmd cd bash)"
#eval "$(zoxide init bash)"

alias ls='exa'

eval "$(thefuck --alias)"

mkcd() {
    mkdir -p "$1" && cd "$1"
}


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init bash)"
