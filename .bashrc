# .bashrc
alias v='vim'
alias n='nvim'
alias p='python'
alias m='tldr'
alias s='~/scripts/launchspt.sh'
alias a='abook'
alias aoc='aocli'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias code='codewars-cli'
alias d='dooit'

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
