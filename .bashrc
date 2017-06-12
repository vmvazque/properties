# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

## My Stuff
export SCALA_HOME=~/bin/scala-2.12.2
export PATH=$PATH:$SCALA_HOME/bin
export NODE_HOME=~/.nvm/versions/node/v6.10.3
export PATH=$PATH:$NODE_HOME/bin



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

up() { 
  cd $(eval printf '../'%.0s {1..$1}) && pwd; 
}

mkdirg() {
  mkdir $1 && cd $1 && pwd;
}

function old() {
  if [ $# -ne 0 ]
    then
      mv $1 $1.old
  fi
}

function unold() {
  if [ $# -ne 0 ]
    then
      name=$(eval basename $1 .old)
      mv $1 $name
  fi
}

alias mkdir='mkdir -pv'
alias reload='source ~/.bashrc'
#helps with typos
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd..="cd .."
alias c="clear"

#dev stuff
export DEV="/home/vmvazque/dev"
export hg="hogwarts"
dev() {
  cd $DEV/$1
}

eu() {
  cd edu/ucsd && cd $1
}

seu() {
  cd scedu/ucsd && cd $1
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
      echo "'$1' is not a valid file"
  fi
}