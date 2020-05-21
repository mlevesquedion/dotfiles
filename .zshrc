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
export PATH="$PATH:/home/michael/julia-1.3.1/bin"
export EDITOR=vim
export PAGER=less
export JDK_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

export DOTFILES="$HOME/dotfiles"
export VIMRC="$HOME/.vimrc"
export ZSHRC="$HOME/.zshrc"
export CONFIG="$HOME/.config"
export I3CFG="$CONFIG/i3"
export POLYBARCFG="$CONFIG/polybar"
export ROFICFG="$CONFIG/rofi"
export DUNSTCFG="$CONFIG/dunst"

export DOW="$HOME/Downloads/"

# Remove annoying "Couldn't connect to accessibility bus" messages
export NO_AT_BRIDGE=1

# Save last directory so we can jump to it
export PROMPT_COMMAND="pwd > $HOME/.whereami"
precmd() { eval "$PROMPT_COMMAND" }

###############################################################################
# ZSH
###############################################################################
ZSH_THEME="mlevesquedion"

autoload -U compinit && compinit -u
plugins=(
colored-man-pages
git
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
alias b=bat
alias c=cat
alias f=fzf
alias i='sudo apt install'
alias o=openall
alias s='sudo $(fc -ln -1)'
alias t=tree
alias v='vim -o -n'
alias vf='vim -o -n `fzf`'
alias w=view

# More Essentials
alias wcs='wc *'
alias rgi='rg -i'
alias lc='wc -l'
alias lcs='wc -l *'
alias ev=expr
alias ee=". ~/bin/ee"
alias tk=take
alias tf='tree -i -f'
alias fdir='fd -t d'
alias mx='chmod u+x'
alias clip='xclip -selection clipboard'

# processes
alias pg=pgrep
alias pk=pkill
alias pks='pkill slack'
alias pkd='pkill Discord'
alias pkj='pkill jupyter'

# ripgrep
alias rgi='rg -i'
alias rgl='rg -l'

# Do it all
alias ba='bat *'
alias ea='e *'
alias eea=". ~/bin/ee *"
alias oa='openall *'
alias va='vim -o -n *'
alias gal='alias | grep'

# Constraint programming
alias mz=minizinc

# Better defaults
alias cp='cp -i'
alias mv='mv -i'
alias rm=rm-wrapper
alias df='pydf'

# Wrappers
alias cpr='cp -r'
alias rmf='rm -rf'
alias tarc='tar -cvf'
alias tarx='tar -xvf'
alias diff=diff-wrapper
alias mkcd=take
alias path=realpath

# Functional
alias map='xargs -L1'
alias filter=grep

# Config
# alias vc=scr vc
alias zc="vim -n $ZSHRC; source $ZSHRC"
alias ic="vim ~/.config/i3/config"
alias sz="source ~/.zshrc"
alias vs="vim -n ~/.vim/bundle/vim-snippets/UltiSnips"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias roficfg="vim ~/.config/rofi/config"
alias polycfg="vim ~/.config/polybar/config"

# Temp files
alias ct='take /tmp/$RANDOM'
alias vt='ct && v $RANDOM'
alias vtx='ct && v $RANDOM.tex'
alias vtm='ct && v $RANDOM.md'
alias vtr='ct && v main_$RANDOM.rs'

# Todos
alias td='vim ~/Documents/TODOS/todo.md'

# Misc
alias sc=systemctl
alias ankify='python3 /home/michael/Development/Python/md_to_anki/md_to_anki.py'
alias batt="acpi -b"
alias cls=clear
alias empty='sed -i -n G'
# alias opam="OPAMROOT=~/.opam2 /home/michael/.opam/system/lib/opam-devel/opam"
alias rebar=rebar3
alias rkt='racket'
alias sha256="shasum -a 256"
alias sha512="shasum -a 512"
alias say=spd-say
alias stats=zsh_stats
alias cleartex='rm *.aux; rm *_latexmk; rm *.log; rm *synctex.gz; rm *.fls; rm *.out'
alias docker='sudo docker'
alias da=date
alias dat=date
alias ate=date
alias te=date
alias chrome=google-chrome
alias ack='echo "use rg"'
alias wn1='watch -n 1'

###############################################################################
# HASKELL
###############################################################################
# alias stn='. stacknew'
# alias sti='stack install'
# alias stg='stack ghci'
# alias sts='stack setup'
# alias stb='stack build'
# alias stt='stack test'
# alias str='stack run'

# alias gi=ghci
# alias hi=ghci
# alias hr=runhaskell
# alias hrun=runhaskell
# alias dt=doctest

###############################################################################
# JULIA
###############################################################################
alias j='julia -q'

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
# . /home/michael/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# eval `opam config env`

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
alias pi='ipython --TerminalInteractiveShell.editing_mode=vi --no-confirm-exit --no-banner'
alias ip=pi
alias p=python3.6
alias p3=python3.6
alias p8=python3.8
alias python=python3.6
alias pt='python -m pytest tests -vv --doctest-modules'
alias pip=pip3
alias pipi='pip3 install --user'
alias wp='watch -n 0.8 python3'

###############################################################################
# C
###############################################################################
alias cc='clang -Wall'

###############################################################################
# IDRIS
###############################################################################
# alias idr=idris

###############################################################################
# GIT
###############################################################################
alias gs='git status -s'
alias gst='git status -s'
alias gin='git init'
alias gstats=git-quick-stats

###############################################################################
# GO
###############################################################################
# alias gohome="cd $GOSRC"
# alias gh=gohome
# alias gob='go build'
# alias got='go test'
# alias goi='go install'
# alias gor='go run'

###############################################################################
# RUST
###############################################################################
source $HOME/.cargo/env
alias car=cargo
alias rc=rustc

# starting a project
alias carn=". ~/bin/carn"
alias carnl=". ~/bin/carnl"

# managing dependencies
alias cara="cargo add"
alias carm="cargo rm"
alias caru="cargo update"

alias carc="cargo clippy"
alias carb="cargo build"
alias carr="cargo run --release"
alias carrb="cargo run --bin"
alias carre="cargo run --example"
alias carm="cargo modules tree"
alias cart="cargo test"
alias care="cargo expand"
alias cari="cargo install"

# for racer
RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

###############################################################################
# RUBY
###############################################################################
alias irb=pry
alias gi='gem install --user'
# alias ru='ruby -I.'

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
bindkey "^P" up-history  # readline compatibility
bindkey "^N" down-history  # readline compatibility
bindkey "^K" up-history
bindkey "^J" down-history
bindkey "^Z" autosuggest-execute
bindkey "^E" edit-command-line

bindkey "^R" fzf-history-widget
bindkey "^F" fzf-file-widget
bindkey "^V" fzf-cd-widget

bindkey -s "^O" "^Qcd -^M"

###############################################################################
# MISCELLANEOUS
###############################################################################
[ -z "$PS1" ] && return

function cd {
  builtin cd "$@" && ls -F
}

# Prevent annoying wait when trying to pip install
pkill gnome-keyring-daemon
_ignored="$(gnome-keyring-daemon &)"

# Disable <C-s> (suspend)
stty -ixon

# Notifications
eval $(dbus-launch)

# Jump to last used directory
[[ -f "$HOME/.whereami" ]] && cd "$(cat "$HOME/.whereami")"

# Create
[[ ! -e "/tmp/deleted" ]] && mkdir /tmp/deleted

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
