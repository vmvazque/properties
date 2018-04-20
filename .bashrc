# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

## My Stuff
export SCALA_HOME=~/bin/scala-2.12.2
export PATH=$PATH:$SCALA_HOME/bin
export NODE_HOME=~/.nvm/versions/node/v6.10.3
export PATH=$PATH:$NODE_HOME/bin

for entry in ~/bin/*
do
  if [ -d $entry ]; then
    if [ -d $entry/bin ]; then
      echo "Adding '$entry/bin' to path"
      export PATH=$PATH:$entry/bin
    fi
  fi
done

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
export DEV="/home/$(whoami)/dev"
alias hog="dev hogwarts"
alias log="tail -f $HOME/.bcs.servlet.logs/catalina.out"
# alias pqubatch='sh $HOME/dev/bin/pqubatch.sh $1'
alias datastudio='sh $HOME/scripts/datastudio/datastudio.sh &'
# alias guilog='java -Dsun.java2d.opengl=True -cp $HOME/bin/guilogging/guilogging.jar -port=1234 &'
alias guilog='java -jar $HOME/bin/guilogging/bcs-antlibs-guilogging.jar &'
alias de='env | grep DOCKER_'

rport=8103
lport=8009
alias tunnel="ssh -N -R $rport:localhost:$lport vmvazque@dbsportal4.ucsd.edu"

#alias pqu='java -jar $HOME/dev/jars/pqu.jar $@'
alias pqin="pqu -out repo.default -in $1"

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

sbtjava() {
  cd src/main/java/edu/ucsd/bio/$1
}

sbtscala() {
  cd src/main/scala/edu/ucsd/bio/$1
}

function npmDo { 
  (PATH=$(npm bin):$PATH; eval $@;) 
}

function dm() {
  eval $(docker-machine env $1)
}

function unsetDm() {
  eval $(docker-machine env -u) 
}

export prefix='/home/vmvazque/dev/sbtMove/bcs_javacore/src/test/resources/edu/ucsd/bio'
export tempDir='/home/vmvazque/dev/sbtMove/bcs_javacore/src/test/java/edu/ucsd/bio'
function moveShit() {
  mv $tempDir/$moveDir/$1 $prefix/$moveDir/
}
function grr() {
  mkdir $1
  export moveDir=$1
  echo $moveDir
}

source ~/.xsessionrc
