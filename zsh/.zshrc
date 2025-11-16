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

and_apk_last() {
  adb -s "$LAST_DEVICE" install "$LAST_APK"
}

and_apk() {
  local device
  device=$(adb devices | grep -v 'List' | fzf | awk '{ print $1}')
  export LAST_DEVICE="$device"
  local apk
  apk=$(fd --no-ignore . | grep -e 'apk$' | fzf)
  export LAST_APK="$apk"
  adb -s "$device" install "$apk"
}

alias and_em='emulator -avd $(emulator -list-avds | fzf)'
alias and_tb_on='adb shell settings put secure enabled_accessibility_services com.google.android.marvin.talkback/com.google.android.marvin.talkback.TalkBackService'
alias and_tb_off='adb shell settings put secure enabled_accessibility_services com.android.talkback/com.google.android.marvin.talkback.TalkBackService'
alias and_fs_sm='adb shell settings put system font_scale 0.85'
alias and_fs_df='adb shell settings put system font_scale 1.0'
alias and_fs_l='adb shell settings put system font_scale 1.15'
alias and_fs_xl='adb shell settings put system font_scale 1.3'
alias and_fs_xxl='adb shell settings put system font_scale 2.0'
alias and_colinv_on'adb shell settings put secure accessibility_display_inversion_enabled 1'
alias and_colinv_off'adb shell settings put secure accessibility_display_inversion_enabled 0'
alias and_htc_on='adb shell settings put secure high_text_contrast_enabled 1'
alias and_htc_off='adb shell settings put secure high_text_contrast_enabled 0'
alias and_nav_gesture='adb shell cmd overlay enable com.android.internal.systemui.navbar.gestural'
alias and_nav_button='adb shell cmd overlay disable com.android.internal.systemui.navbar.gestural && adb shell cmd overlay enable com.android.internal.systemui.navbar.threebutton'
# alias and_nav_button='adb shell cmd overlay enable com.android.internal.systemui.navbar.button'

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
mvenv() {
  python3 -m venv .venv && source ./.venv/bin/activate
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

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --border=none \
  --color=border:#29a4bd \
  --color=fg:#c0caf5 \
  --color=gutter:#1f2335 \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#29a4bd \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

source <(fzf --zsh)
export K9S_CONFIG_DIR="$HOME/.config/k9s"

de_quarantine() {
  xattr -d com.apple.quarantine $1
}

lower_case_dir() {
  dir="."
  for file in "$dir"/*; do
    if [[ -f "$file" ]]; then
      base=$(basename "$file")
      newname=$(echo "$base" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
      if [[ "$base" != "$newname" ]]; then
        mv "$file" "$dir/$newname"
        echo "Renamed $base -> $newname"
      fi
    fi
  done
}
