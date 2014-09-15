
CYAN="\[\e[1;36m\]"
BLUE="\[\e[1;34m\]"
END_COLOR="\[\e[m\]"
PS1="${CYAN}[\!:\u]${BLUE}[\w]${END_COLOR} "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth:erasedups

alias vi="vim"
alias cdldw="cdl ~/workspace/lumos_data_warehouse"
alias cdca="cdl ~/workspace/catapult"
alias cdcr="cdl ~/workspace/chef-repo"
alias cdeds="cdl ~/workspace/eventd-server"
alias cdees="cdl ~/workspace/evente-server"
alias cdeec="cdl ~/workspace/evente-client"
alias cdlr="cdl ~/workspace/lumos_rails"
alias cdlu="cdl ~/workspace/lumos_utils"
alias cdlc="cdl ~/workspace/lumoscalog"
alias cdcmt="cdl ~/Dropbox/cmt/cmt_3.0"
alias cdor="cdl ~/workspace/matt/outread"
alias c="cdl"
alias ctags="`brew --prefix`/bin/ctags"

alias gpo="git push origin"
alias pull="git pull origin"
alias gb="git branch"
alias gl="git log"
alias glp="git log -p"
alias gs="git status"
alias gc="git commit -m"
alias gp="git pull"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gck="git checkout"

alias :e="gvim"
alias :q="exit"
alias :Q="exit"

alias hgrep="history | grep -i --color"
alias grepp="grep --color -rin"
alias psgrep="ps aux | grep"

alias be="bundle exec"
alias bersp="bundle exec rspec"
alias berdbc="bundle exec rake db:create"
alias berdbd="bundle exec rake db:drop"
alias berdbm="bundle exec rake db:migrate"
alias berdbs="bundle exec rake db:seed"

alias mems="memory show"
alias nagios="memory show operations nagios"
alias splunk="memory show operations splunk"
alias cacti="memory show operations cacti"
alias rollbar="memory show operations rollbar"
alias softlayer="memory show operations softlayer"
alias dme="memory show operations dnsmadeeasy"
alias newrelic="memory show operations newrelic"

alias sshsta="ssh lumoslabs@staging"
alias sshaw2="ssh lumoslabs@10.26.2.164"
alias sshrxl="ssh reports-xl"
alias sshdb5="ssh lumoslabs@db5"
alias sshdb9="ssh lumoslabs@db9"
alias sshrd="ssh reports-dev"
alias ssheds1="ssh lumoslabs@eventd-staging-1"
alias ssheds2="ssh lumoslabs@eventd-staging-2"
alias ssha28="ssh lumoslabs@10.57.17.86"
alias ssha29="ssh lumoslabs@app29"
alias ssha34="ssh lumoslabs@app34"
alias sshub="ssh 174.37.219.206"
alias ssmhub="ssh mleung@174.37.219.206"
alias tls="tmux list-sessions"
alias attach="tmux attach -t"
alias tmuxn="tmux new -s"

alias hopper="ssh mpleung@hopper.nersc.gov"
alias carver="ssh mpleung@carver.nersc.gov"

alias upload="knife cookbook upload"
knives() {
  if [ -z "$2" ]
  then knife ssh "$1" "hostname" -x lumoslabs -a hostname | sort
  else knife ssh "$1" "$2" -x lumoslabs -a hostname | sort
  fi
}
kne() {
  knife node edit "$*".sl.lumoslabs.com
}
cdl() {
  if [ -z "$1" ]
  then cd; ls;
  else cd "$*"; ls;
  fi
}
greps() {
  grep --color -rin "$*" *
}


#
#   0 (zero)
#          The zeroth word.  For the shell, this is the command word.
#   n      The nth word.
#   ^      The first argument.  That is, word 1.
#   $      The last argument.
#   %      The word matched by the most recent ‘?string?’ search.
#   x-y    A range of words; ‘-y’ abbreviates ‘0-y’.
#   *      All of the words but the zeroth.
#          This is a synonym for ‘1-$’.
#          It is not an error to use * if there is just one word in
#          the event; the empty string is returned in that case.
#   x*     Abbreviates x-$.
#   x-     Abbreviates x-$ like x*, but omits the last word.
#
#   If a word designator is supplied without an event
#   specification, the previous command is used as the event.
#   0 (zero)
#          The zeroth word.  For the shell, this is the command word.
#   n      The nth word.
#   ^      The first argument.  That is, word 1.
#   $      The last argument.
#   %      The word matched by the most recent ‘?string?’ search.
#   x-y    A range of words; ‘-y’ abbreviates ‘0-y’.
#   *      All of the words but the zeroth.
#          This is a synonym for ‘1-$’.
#          It is not an error to use * if there is just one word in
#          the event; the empty string is returned in that case.
#   x*     Abbreviates x-$.
#   x-     Abbreviates x-$ like x*, but omits the last word.
#
#   If a word designator is supplied without an event
#   specification, the previous command is used as the event.
