# go config
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/gocode
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# for python
export PATH=$HOME/library/python/2.7/bin/:/usr/local/share/python:$PATH

# for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

export CLOUDSDK_PYTHON_SITEPACKAGES=1

# for digdag, etc.
export PATH="$HOME/bin:$PATH"
#export PATH=$HOME/.nodebrew/current/bin:$PATH
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

# for dbms
export PGDATA=/usr/local/var/postgres

# alias
alias ls='ls -G' # ls color
alias g='git'
alias cdws='cd ~/Documents/workspace'
alias cdgo='cd ~/gocode/src'
alias push='git push origin HEAD'

function sshi() {
  command echo "executed 'ssh -i ~/.ssh/$1 $2'"
  command ssh -i ~/.ssh/$1 $2
}

function de() {
  command echo "executed 'docker exec -it $1 $2'"
  command docker exec -it $1 $2
}

# git ps1
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

#export PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo "\[\e[33m\]" || echo "\[\e[31m\]"``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
