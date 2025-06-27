set -o vi
alias vim="nvim"

autoload -Uz compinit
compinit

export PROMPT='> '

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
export EDITOR=nvim
export HISTFILESIZE=10000
export HISTSIZE=10000
export FCEDIT=nvim

wow() {
  set -o pipefail

  local v_dir="$2"
  local arch="$2.tar.gz"
  local enc="$2.tga"
  case "$1" in
  e)
    tar czf "$arch" "$v_dir" &&
      age -p -o "$enc" "$arch" &&
      rm -rf "$v_dir" "$arch"
    ;;
  d)
    age -d -o "$arch" "$enc" &&
      tar xzf "$arch" &&
      rm -f "$arch"
    rm -f "$enc"
    ;;
  *)
    echo "Usage e|d"
    ;;
  esac
}

if [ -f "$HOME"/.zshrc_local ]; then
  source "$HOME/.zshrc_local"
fi

source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

alias dir_size='du -hs'
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
alias td="tmux detach"
alias tc="tmux clear-history"

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

if command -v bat &>/dev/null; then
  alias cat='bat --paging=never --style=plain'
  alias catt='bat'
  alias cata='bat --show-all --paging=never'
fi

alias gcfg='cd $HOME/Library/Application\ Support/com.mitchellh.ghostty/'
alias yz='yazi'

alias fdi='fd . --no-ignore'
alias cdd='cd "$(fd -t d | fzf)"'
alias lzd='cd ~/.local/share/nvim/lazy'

# Git
alias lg='lazygit'
alias gcb='git checkout $(git branch | fzf)'
alias grr="git reflog --pretty='%gD %gs' | fzf | awk '{ print $1 }'"

# And
and_apk() {
  local device
  device=$(adb devices | grep -v 'List' | fzf | awk '{ print $1}')
  local apk
  apk=$(fd --no-ignore . | grep -e 'apk$' | fzf)
  adb -s "$device" install "$apk"
}
alias and_em='emulator -avd $(emulator -list-avds | fzf)'

start_aero() {
  open -a Aerospace
}

kp() {
  ps -ef | fzf -m | awk '{print $2}' | tee /dev/tty | xargs -r kill -9
}

kc() {
  docker ps | fzf -m | awk '{print $1}' | xargs -r docker kill
}

j() {
  echo "$JAVA_HOME"
}

venv() {
  source ./.venv/bin/activate
}

nhist() {
  export HISTFILE=/dev/null
}

aliasify() {
  local selected cmd aliasname escaped

  # Use HISTTIMEFORMAT='' to avoid timestamps interfering
  selected=$(HISTTIMEFORMAT= history | fzf --tac --no-sort --height=40% --reverse) || return

  # Extract everything after the command number using awk
  cmd=$(echo "$selected" | awk '{$1=""; sub(/^ +/, ""); print}')

  echo "Command: $cmd"
  echo -n "Alias name: "
  read -r aliasname

  if [[ -z "$aliasname" ]]; then
    echo "No alias name given."
    return 1
  fi

  # Properly quote the command TODO: escape this properly
  escaped=$cmd

  echo "alias $aliasname='$escaped'" >>~/.zshrc
  echo "Alias '$aliasname' added to ~/.zshrc"
}
alias ppath='echo $PATH | sed "s/:/\n/g"'
