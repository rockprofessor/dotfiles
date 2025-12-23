# .bashrc
alias v='vim'
alias n='nvim'
alias p='python'
alias man='tldr'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias code='codewars-cli'
alias d='dooit'
alias o='okular'
alias rmtex='rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.pdf *.synctex.gz *.toc'
alias reddit='tuir'
alias c='calcurse'
alias m='aerc'
alias rm='trash'
alias spot='spotatui'

# create mkcd command
mkcd() {
    mkdir -p "$1" && cd "$1"
}

gitit() {
    git add .
    git commit -m 'updated'
    git push
}

wiki() {
    wikit "$1" | sed 's/\[[^]]*\]//g' | tr '\n' ' ' | sed 's/  */\n/g' | fold -s -w 72 | sed 's/^[[:space:]]\+//' | sed '1s/^[[:space:]"'\''\]]\+//' | ttyper /dev/stdin
}

wikide() {
    wikit -l de "$1" | sed 's/\[[^]]*\]//g' | tr '\n' ' ' | sed 's/  */\n/g' | fold -s -w 72 | sed 's/^[[:space:]]\+//' | sed '1s/^[[:space:]"'\''\]]\+//' | ttyper /dev/stdin
}

wikitex() {
    cat "$1" | sed 's/\[[^]]*\]//g' | tr '\n' ' ' | sed 's/  */\n/g' | fold -s -w 72 | sed 's/^[[:space:]]\+//' | sed '1s/^[[:space:]"'\''\]]\+//' | ttyper /dev/stdin
}

splittext() {
    awk -v n="${2:-300}" '
  {
    for (i=1; i<=NF; i++) {
      word=$i
      if (!out) out=sprintf("chapter_%03d.txt", ++f)
      printf "%s%s", word, OFS >> out
      w++
      if (word ~ /[.!?]["'\''”)]*$/ && w >= n) {
        close(out)
        out=""
        w=0
      }
    }
  }
  END { if (out) close(out) }
  ' "$1"
}

export PATH="/home/robert/.vim/bundle/vim-live-latex-preview/bin:$PATH"
export PATH="/home/robert/.cargo/bin:$PATH"
export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"

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

# vim motions on command line
set -o vi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# exa to replace ls
alias ls='exa'

# the fuck
eval "$(thefuck --alias)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
alias f='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}" | xargs -n 1 nvim'

# starship prompt
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init bash)"

# make nvim default
export EDITOR=nvim
export VISUAL=nvim

# zoxide configuration
eval "$(zoxide init --cmd cd bash)"
