export PATH="$HOME/bin:$PATH"
export PATH="$(python3 -m site --user-base)/bin:$PATH"
export EDITOR=vim
. ~/.cargo/env

export BAT_THEME="Dracula"

# Dracula theme for FZF
# Removed the background colors because they looked bad
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mlevesquedion"

export ZVM_VI_ESCAPE_BINDKEY=jk

zstyle ':omz:plugins:git' aliases no

plugins=(
  colored-man-pages
  extract
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases

# Vim mode
bindkey -v

bindkey jk vi-cmd-mode

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^Z' autosuggest-execute
bindkey '^E' edit-command-line
bindkey '^F' fzf-file-widget
bindkey '^V' fzf-cd-widget
bindkey -s "^O" 'vim +History^M'
bindkey -s "^G" 'vim +Rg^M'

# ls on cd
function cd {
  builtin cd "$@" && ls -F
}

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Save last directory so we can jump to it
export PROMPT_COMMAND="pwd > $HOME/.whereami"
precmd() { eval "$PROMPT_COMMAND" }
[[ -f "$HOME/.whereami" ]] && cd "$(cat "$HOME/.whereami")"

date
