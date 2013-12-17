
CYAN="\[\e[1;36m\]"
BLUE="\[\e[1;34m\]"
END_COLOR="\[\e[m\]"
PS1="${CYAN}[\!:\h]${BLUE}[\w]${END_COLOR} "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias c="cdl"

alias gpo="git push origin"
alias pull="git pull origin"
alias gb="git branch"
alias gl="git log"
alias gs="git status"
alias gc="git commit -m"
alias gp="git pull"

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

cdl() {
  cd "$*"
  ls
}
