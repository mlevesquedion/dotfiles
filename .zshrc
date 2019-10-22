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
export PATH="$PATH:/home/michael/.gem/ruby/2.5.0/bin"
export PATH="$PATH:/home/michael/.cabal/bin"
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
ZSH_THEME="mlevesquedion"

autoload -U compinit && compinit -u
plugins=(
  git
  mvn
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $(dirname $(gem which colorls))/tab_complete.sh

###############################################################################
# ALIASES
###############################################################################
# Essentials
alias a=ack
alias b=bat
alias i='sudo apt install'
alias o=openall
alias g=grep
alias s='sudo $(fc -ln -1)'
alias t=tree
alias v='vim -o -n'

# More Essentials
alias ev=expr
alias ee=". ~/bin/ee"
alias tk=take
alias tf='tree -i -f'
alias jn='jupyter notebook'
alias fdir='fd -t d'
alias mx='chmod u+x'
alias pk=pkill
alias pks='pkill slack'
alias pkx='sudo pkill X'
alias vw=view
alias clip='xclip -selection clipboard'

# Do it all
alias ba='bat *'
alias ea='e *'
alias eea=". ~/bin/ee *"
alias oa='openall *'
alias rma='rm *'
alias va='vim -o -n *'
alias gal='alias | grep'

# Better defaults
alias cp='cp -i'
alias mv='mv -i'
alias df='pydf | rg nvme --color never'

# Wrappers
alias rmf='rm -rf'
alias cpr='cp -r'
alias psa='ps aux'
alias rmd=rmdir
alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias mkcd=take
alias path=realpath

# Functional
alias map='xargs -L1'
alias filter=grep

# Config
alias vc="vim -n $VIMRC"
alias zc="vim -n $ZSHRC; source $ZSHRC"
alias ic="vim ~/.config/i3/config"
alias sz="source ~/.zshrc"
alias vs="vim -n ~/.vim/bundle/vim-snippets/UltiSnips"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias roficfg="vim ~/.config/rofi/config"
alias polycfg="vim ~/.config/polybar/config"

# Temp files
alias ct='take /tmp/$RANDOM'
alias vt='vim $RANDOM'
alias ctvt='ct && vt'
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
alias stats=zsh_stats
eval $(thefuck --alias)

###############################################################################
# HASKELL
###############################################################################
alias stn='. stacknew'
alias sti='stack install'
alias stg='stack ghci'
alias sts='stack setup'
alias stb='stack build'
alias stt='stack test'

alias gi=ghci
alias hi=ghci
alias hr=runhaskell
alias hrun=runhaskell

###############################################################################
# JEKYLL
###############################################################################
alias js='bundle exec jekyll serve --watch --drafts'

###############################################################################
# MAVEN
###############################################################################
alias mvt='mvn clean test'
alias mvi='mvn clean install'
alias mvp='mvn clean package'

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
# IDRIS
###############################################################################
alias idr=idris

###############################################################################
# GIT
###############################################################################
alias gin='git init'
alias gst='git status -s'
alias gitstat=git-quick-stats

###############################################################################
# GO
###############################################################################
alias gohome="cd $GOSRC"
alias gob='go build'
alias got='go test'
alias goi='go install'
alias gor='go run'

###############################################################################
# RUST
###############################################################################
source $HOME/.cargo/env
# alias cr="cargo run"
# alias cb="cargo build"
# alias crbt="RUST_BACKTRACE=1 cargo run"
# alias ct="cargo test"
# alias cf="cargo fix"

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
