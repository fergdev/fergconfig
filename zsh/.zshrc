set -o vi
alias vim="nvim"

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
export EDITOR=nvim
export HISTFILESIZE=10000
export HISTSIZE=10000
export FCEDIT=nvim

dirsize() {
    du -shx * .[a-zA-Z0-9_]* 2>/dev/null |
        grep -E '^ *[0-9.]*[MG]' | sort -n >/tmp/list
    grep -E '^ *[0-9.]*M' /tmp/list
    grep -E '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

extract() {
    if [ -f $1 ]; then
        case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) rar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

killem() {
    PROCESS_ID=$(ps aux | grep "$1" | grep -v grep | awk '{print $2}')
    echo "killing id $PROCESS_ID"
    echo "$PROCESS_ID" | xargs kill -9
}

vlt() {
    local vlt_dir="$HOME/.vlt"
    local archive="$HOME/.vlts.tar.gz"
    local encrypted="$HOME/.vlts.tar.gz.age"

    case "$1" in
    e)
        echo "[*] Archiving and encrypting $vlt_dir..."
        tar -czf "$archive" -C "$HOME" "vlts" &&
            age -p -o "$encrypted" "$archive" &&
            rm -rf "$vlt_dir" "$archive"
        echo "[✓] Encrypted to $encrypted and wiped plaintext."
        ;;
    d)
        echo "[*] Decrypting $encrypted..."
        age -d -o "$archive" "$encrypted" &&
            tar -xzf "$archive" -C "$HOME" &&
            rm -f "$archive"
        rm -f "$encrypted"
        echo "[✓] Decrypted and extracted to $vlt_dir."
        ;;
    *)
        echo "Usage: vlt encrypt | decrypt"
        ;;
    esac
}

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

alias nvd='cd ~/.local/share/nvim'
alias df='cd ~/.dotfiles'

alias tf='tmux source ~/.tmux.conf'
alias tfe='vim ~/.tmux.conf'

alias zf='source ~/.zshrc'
alias zfe='vim ~/.zshrc'

alias zl='source ~/.zshrc_local'
alias zle='vim ~/.zshrc_local'

alias rgd="rg --hidden --glob '!.git/*' . | fzf"

alias ta="tmux attach"
alias td="tmux detatch"

# ls replacement
# exa is unmaintained, so now using eza
# https://github.com/ogham/exa
if command -v eza &>/dev/null; then
    alias ls='eza'
    alias ll='eza -lhg'
    alias lla='eza -alhg'
    alias tree='eza --tree'
else
    alias ls='ls --color=auto'
    alias ll='ls -lhg --color=auto'
    alias lla='ls -alhg --color=auto'
    alias grep='grep --color=auto'
fi

# Bat -> Cat with wings
# https://github.com/sharkdp/bat
if command -v bat &>/dev/null; then
    # --style=plain - removes line numbers and got modifications
    # --paging=never - doesnt pipe it through less
    alias cat='bat --paging=never --style=plain'
    alias catt='bat'
    alias cata='bat --show-all --paging=never'
fi

alias gcfg='cd $HOME/Library/Application\ Support/com.mitchellh.ghostty/'
alias ff='fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim'
alias yz='yazi'

if [ -f "$HOME"/.zshrc_local ]; then
    source "$HOME/.zshrc_local"
fi

source <(fzf --zsh)

export PROMPT='%1~ %# '

# res() {
#     skhd --restart-service
#     yabai --restart-service
# }

start_aero() {
    open -a Aerospace
}

kp() {
    # ps -ef | fzf -m --preview="echo {}" --height=40% | awk '{print $2}' | xargs -r kill -9
    ps -ef | fzf -m | awk '{print $2}' | tee /dev/tty | xargs -r kill -9
}

kc() {
    docker ps | fzf -m | awk '{print $1}' | xargs -r docker kill
}

j() {
    echo "$JAVA_HOME"
}
