# My dotfiles folder
ZSHFILES=$HOME/.config/zsh

bindkey -v
bindkey '^R' history-incremental-search-backward

# History
source $ZSHFILES/history.zsh

# Keybinding defaults
source $ZSHFILES/keycodes.zsh

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Completion
autoload -U compinit && compinit
source $ZSHFILES/completion.zsh

# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Colors to the prompt
autoload -U colors && colors

# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# For GNU ls, we use the default ls color theme. They can later be
# overwritten by themes.
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

ls --color -d . &>/dev/null && alias ls='ls --color=tty' \
    || { ls -G . &>/dev/null && alias ls='ls -G' }

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# source shrink_path
source $ZSHFILES/shrink_path.zsh

# Load prompt
setopt prompt_subst
source $ZSHFILES/zsh-prompt

# Defining text editor 
export EDITOR=vim

# Aliases
alias ll="ls -la"
alias la="ls -a"
alias sl="ls"
# Alias for dotfiles repo on ~
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Hashes to most used dirs.
setopt cdablevars
hash -d ifrn="$HOME/Dropbox/ifrn/"
hash -d phd="$HOME/Dropbox/phd/"

# Search history of typed command with up/down keys
bindkey "${terminfo[kcuu1]}" up-line-or-search
bindkey "${terminfo[kcud1]}" down-line-or-search


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^o' 'lfcd\n'

# Source EDA env functions
source $ZSHFILES/eda_envs.sh

# Add texlive to path if it exists
if [ -d /usr/local/texlive/2020/bin/x86_64-linux ]; then
    PATH=$PATH:/usr/local/texlive/2020/bin/x86_64-linux # Add Latex to path
fi
