
setopt histignorealldups sharehistory


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zoxide
eval "$(zoxide init zsh)"

# mine
source "$HOME/.bash_aliases"
#alias ls='ls --color=auto'

# starship prompt?
eval "$(starship init zsh)"
export STARSHIP_LOG=error # ?

# fzf
# Set up fzf key bindings and fuzzy completion (ctrl + t and ctrl + r)
source <(fzf --zsh)

# add ~/bin to $PATH, prepend
path=("$HOME/bin" $path)

# rust
. "$HOME/.cargo/env"

# remove background colors in ls
LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;34:'; export LS_COLOR

# disable cursor blinking
echo "\e[2 q"

# aspect for clockascii
export ASPECT="0.4"

# piper voice thing
if [ -d "$HOME/piper" ] ; then
    PATH="$HOME/piper:$PATH"
fi

. "$HOME/.local/bin/env"
. "/home/b/.deno/env"

# making FZF to look like my fancy note script
# Black & white - explicitly disable all colors
export FZF_DEFAULT_OPTS="--no-color --pointer='>' --color=fg:-1,bg:-1,hl:-1,fg+:-1,bg+:-1,hl+:-1,info:-1,prompt:-1,spinner:-1,pointer:-1,marker:-1,border:-1"

# CTRL-T command - recent files first
export FZF_CTRL_T_COMMAND='find . -type f -not -path "./.git/*" -printf "%T@ %p\n" 2>/dev/null | sort -nr | cut -d" " -f2-'

# Preview configuration
export FZF_CTRL_T_OPTS="
  #--no-color
  --prompt='file> '
  --pointer='>'
  --marker='*'
  --bind='tab:toggle'
  --preview='
    if file --mime -b {} 2>/dev/null | grep -q ^image/; then
      width_px=\$((FZF_PREVIEW_COLUMNS))
      height_px=\$((FZF_PREVIEW_LINES))
      chafa -f sixels --size=\${width_px}x\${height_px} {} 2>/dev/null
    elif file --mime -b {} 2>/dev/null | grep -q ^video/; then
      #mediainfo {} 2> /dev/null
      middleFrameFzf {} 2> /dev/null
    elif file --mime -b {} 2>/dev/null | grep -q binary; then
      echo \"[BINARY: \$(basename {})]\"
    else
      fold -s -w \$FZF_PREVIEW_COLUMNS {} 2>/dev/null
    fi
  '
  --preview-window='right:50%'
  --height=80%
  --reverse"
