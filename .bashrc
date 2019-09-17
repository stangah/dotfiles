# .bashrc -*- Mode: Shell-script; -*-

# Don't do anything if we are a non-interactive shell.
[[ -z "$PS1" ]] && return

# Load Bash It early so we can over-ride some of the poor choices.
if [[ -d $HOME/.bash_it ]]; then
    export BASH_IT=$HOME/.bash_it
    # shellcheck source=/dev/null
    source $BASH_IT/bash_it.sh
fi

# Load the library
# shellcheck source=.bash_library
[[ -f $HOME/.bash_library ]] && . $HOME/.bash_library

# Aliases
# Note: never use an alias when a shell script will do.
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias nano="subl"
alias s.="subl ."
alias git=hub

alias tinit='terraform init'
alias tplan='terraform plan'
alias tapply='terraform apply'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gco='git checkout'
alias gs='git status'
alias gf='git fetch'
alias gfr='git fetch && git rebase'
alias gl='git l'
alias gm='git merge'
alias gp='git push'
alias gr='git rebase'
alias gt='git reset'
alias gu='git pull'
alias guum='git pull upstream master:master'
alias gst='git stash'
alias gsp='git stash pop'
alias gpob='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias ghist="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

alias gpr="git pull-request --browse"

alias hgrep='history | grep'
alias rgrep='rake -T | grep'
alias h='history | tail -n 24'
alias mysql='mysql -p'

alias ni='npm install'

alias ls='ls -GFh'

# Shell Options

# Append to the history file instead of destroying it every time.
shopt -s histappend

# Attempt to perform hostname completion when a word containing an @ is being
# completed.
shopt -s hostcomplete

# Save multiline shell commands as one line in the history.
shopt -s cmdhist

# Do not attempt to search the PATH for possible completions when completion is
# attempted on an empty line.
shopt -s no_empty_cmd_completion

# Turn on programmable completion
shopt -s progcomp

HISTFILESIZE=10000
HISTSIZE=$HISTFILESIZE
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Turn on color for FreeBSD/Darwin ls
export CLICOLOR=yes
# Set FreeBSD/Darwin ls colors to be Solarize like
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Nodeenv
inpath nodenv && eval "$(nodenv init -)"

# Pyenv
inpath pyenv && eval "$(pyenv init -)"

# Finally, source a .bashrc.local for site specific crap.
# shellcheck source=/dev/null
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

# Set up direnv
if command -v direnv >/dev/null; then
    eval "$(direnv hook bash)"
fi

# Increase limit for number of simultaneous files open (thanks dep.)
ulimit -n 5000

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
