###############################################################################
# ENVIRONMENT VARIABLES
###############################################################################
export ZSH="/home/michael/.oh-my-zsh"
export GOPATH=$HOME/go
export GOSRC=$GOPATH/src/github.com/mlevesquedion
export PATH=$PATH:$GOPATH/bin
export PATH=~/bin:$PATH
export PATH=~/anaconda3/bin:$PATH
export PATH="$PATH:/home/michael/Development/Flutter/flutter/bin"
export PATH="$PATH:/usr/local/go/bin"
export EDITOR=vim
export PAGER=less
export JDK_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre

export DOTFILES="$HOME/dotfiles"
export VIMRC="$HOME/.vimrc"
export ZSHRC="$HOME/.zshrc"
export CONFIG="$HOME/.config"
export I3CFG="$CONFIG/i3"
export POLYBARCFG="$CONFIG/polybar"
export ROFICFG="$CONFIG/rofi"
export DUNSTCFG="$CONFIG/dunst"

# Save last directory so we can jump to it
export PROMPT_COMMAND="pwd > $HOME/.whereami"
precmd() { eval "$PROMPT_COMMAND" }

###############################################################################
# ZSH
###############################################################################
ZSH_THEME="robbyrussell-with-lambda"

autoload -U compinit && compinit -u

plugins=(
  git
  mvn
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

###############################################################################
# ALIASES
###############################################################################
# Essentials
alias b=bat
alias ba='bat *'
alias o=openall
alias s='sudo $(fc -ln -1)'
alias t=tree
alias v='vim -o -n'
alias jn='jupyter notebook'
alias mx='chmod u+x'
alias pk=pkill
alias va='vim -o -n *'
alias vw=view
alias clip='xclip -selection clipboard'

# Better defaults
alias cp="cp -i"
alias mv="mv -i"
alias df="pydf | rg nvme --color never"

# Wrappers
alias rmf='rm -rf'
alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias mkcd=take

# Config
alias vc="vim -n $VIMRC"
alias zc="vim -n $ZSHRC; source $ZSHRC"
alias ic="vim ~/.config/i3/config"
alias sz="source ~/.zshrc"
alias vs="vim -n ~/.vim/bundle/vim-snippets/snippets"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias roficfg="vim ~/.config/rofi/config"
alias polycfg="vim ~/.config/polybar/config"

# Temp files
alias vt='vim /tmp/$RANDOM'
alias vtm='vim /tmp/$RANDOM.md'

# Todos
alias td='vim ~/Documents/TODOS/todo.md'

# Misc
alias ankify='python3 /home/michael/Development/Python/md_to_anki/md_to_anki.py'
alias batt="acpi -b"
alias cls=clear
alias empty='sed -i -n G'
alias opam="OPAMROOT=~/.opam2 /home/michael/.opam/system/lib/opam-devel/opam"
alias rebar=rebar3
alias rkt='racket'
alias sc='shellcheck'
alias sha256="shasum -a 256"
alias sha512="shasum -a 512"
alias say=spd-say
eval $(thefuck --alias)

###############################################################################
# JEKYLL
###############################################################################
alias js='bundle exec jekyll serve --watch --drafts'

###############################################################################
# MAVEN
###############################################################################
alias mt='mvn clean test'
alias mco='mvn clean compile'
alias mcl='mvn clean'
alias mpa='mvn clean package'
alias min='mvn clean install'
alias msi='mvn clean site'

###############################################################################
# OPAM CONFIGURATION
###############################################################################
. /home/michael/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

###############################################################################
# PIPENV
###############################################################################
alias ppd='pipenv install --dev'
alias ppvenv='pipenv --venv'
alias ppg='pipenv graph'
alias pphome='pipenv --where'
alias ppi='pipenv install'
alias ppl='pipenv lock'
alias ppo='pipenv open'
alias ppr='pipenv run'
alias ppt='pipenv run pytest'
alias ppu='pipenv uninstall'
alias ppua='pipenv uninstall --all'
alias ppud='pipenv update'

###############################################################################
# PYTHON
###############################################################################
alias py='ipython3 --no-confirm-exit'
alias pyi='ipython3 -i --no-confirm-exit'
alias pt=pytest
alias python=python3
alias pip=pip3

###############################################################################
# C
###############################################################################
alias cc='clang -Wall'

###############################################################################
# GIT
###############################################################################
alias gst='git status -s'
alias gl='git pull --rebase'
alias gitstat=git-quick-stats

###############################################################################
# GO
###############################################################################
alias gob='go build'
alias got='go test'
alias goi='go install'
alias gor='go run'

###############################################################################
# RUST
###############################################################################
source $HOME/.cargo/env
alias cr="cargo run"
alias cb="cargo build"
alias crbt="RUST_BACKTRACE=1 cargo run"
alias ct="cargo test"
alias cf="cargo fix"

###############################################################################
# ERLANG
###############################################################################
export ERL_AFLAGS="-kernel shell_history enabled"

###############################################################################
# VIM MODE
###############################################################################
bindkey -v
alias :q=exit
alias :q!=exit

###############################################################################
# KEYBINDINGS
###############################################################################
bindkey "^K" up-history
bindkey "^J" down-history
bindkey "^A" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^Z" autosuggest-execute
bindkey "^E" edit-command-line

###############################################################################
# MISCELLANEOUS
###############################################################################
[ -z "$PS1" ] && return

function cd {
    builtin cd "$@" && ls -F
}

# Disable <C-s> (suspend)
stty -ixon

# Notifications
eval $(dbus-launch)

# Prevent annoying wait when trying to pip install
pkill gnome-keyring-daemon
_ignored="$(gnome-keyring-daemon &)"

# Jump to last used directory
[[ -f "$HOME/.whereami" ]] && cd "$(cat "$HOME/.whereami")"
