CYAN="\[\e[1;36m\]"
RED="\[\e[0;31m\]"
LRED="\[\e[1;31m\]"
BLUE="\[\e[1;34m\]"
END_COLOR="\[\e[m\]"
PS1="${CYAN}[\!:\h]${BLUE}[\w]${END_COLOR} "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth:erasedups
export EDITOR=vim


## ls ###########################################################################
alias ls='ls -F --color=auto'
alias lsl='ls -alh'


## git ##########################################################################
function gpo() {
  if [ "$1" == "master" ] && [ "$2" == "-f" ]
  then echo "Not force-pushing to master, you buffoon!";
  else git push origin "$*";
  fi
}
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


## grep #########################################################################
function ufind() {
    find "$1" -type f -not -name "*.jpg" -not -name "*.gif" -not -name "*.png" -not -name "*.swf" -not -name "*.fla" -not -name "*.pdf" -not -name "*.swp" -not -path "*.hg/*" -not -path "*.git/*" -not -path "*.dropbox.cache/*" "$2"
}
function grep_mod() {
  if [ -z "$3" ]
  then ufind . -print0 | xargs -0 grep --color "$1" "$2";
  else ufind "$3" -print0 | xargs -0 grep --color "$1" "$2"
  fi
}
alias grep='grep --color'
alias greps='grep_mod -rin'
alias grepf='grep_mod -il'
alias hgrep="history | grep -i"
alias psgrep="ps aux | grep"


## cds ##########################################################################
cdl() {
  if [ -z "$1" ]
  then cd; ls;
  else cd "$*"; ls;
  fi
}
alias b="cd $OLDPWD"
alias u="cd .."
alias c="cdl"

alias cw="cdl ~/workspace"
alias cdt="cdl ~/workspace/tenyks"
alias cdn="cdl ~/workspace/nagios-api"
alias cdldw="cdl ~/workspace/lumos_data_warehouse"
alias cdhl="cdl ~/workspace/matt/hire_loft"
alias cdca="cdl ~/workspace/catapult"
alias cdcr="cdl ~/workspace/chef-repo"
alias cdeds="cdl ~/workspace/eventd-server"
alias cdees="cdl ~/workspace/evente-server"
alias cdeec="cdl ~/workspace/evente-client"
alias clks="cdl ~/workspace/LumiKidsServer"
alias cdlr="cdl ~/workspace/lumos_rails"
alias cdlu="cdl ~/workspace/lumos_utils"
alias cdlc="cdl ~/workspace/lumoscalog"
alias cdcmt="cdl ~/Dropbox/cmt/cmt_3.0"
alias cdor="cdl ~/workspace/matt/outread"
alias ncli="/Users/mleung/workspace/nagios-api/ncli"


## work-specific ################################################################
function knives() {
  if [ -z "$2" ]
  then knife ssh "$1" "hostname" -x lumoslabs -a hostname | sort
  else knife ssh "$1" "$2" -x lumoslabs -a hostname | sort
  fi
}
function kne() {
  knife node edit "$*".sl.lumoslabs.com
}
alias upload="knife cookbook upload"
alias runchef='echo runchef | sudo -iu lumoslabs /bin/bash'

alias mem="memory show"
alias nagios="memory show operations nagios"
alias splunk="memory show operations splunk"
alias cacti="memory show operations cacti"
alias rollbar="memory show operations rollbar"
alias softlayer="memory show operations softlayer"
alias dme="memory show operations dnsmadeeasy"
alias newrelic="memory show operations newrelic"


## vim ##########################################################################
alias :e="gvim"
alias :q="exit"
alias :Q="exit"
alias vi='vim'


## ssh ##########################################################################
alias hopper="ssh mpleung@hopper.nersc.gov"
alias carver="ssh mpleung@carver.nersc.gov"
alias sshub="ssh 174.37.219.206"
alias ssmhub="ssh mleung@174.37.219.206"


## bundle #######################################################################
alias be="bundle exec"
alias bersp="bundle exec rspec"
alias berdbc="bundle exec rake db:create"
alias berdbd="bundle exec rake db:drop"
alias berdbm="bundle exec rake db:migrate"
alias berdbs="bundle exec rake db:seed"


## tmux #########################################################################
alias tls="tmux list-sessions"
alias attach="tmux attach -t"
alias tmuxn="tmux new -s"


## reference ####################################################################
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
