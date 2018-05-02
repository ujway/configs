# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# go config
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/gocode
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# for python
export PATH=$HOME/library/python/2.7/bin/:/usr/local/share/python:$PATH

# alias
alias g='git'
alias cdws='cd ~/workspace'
alias cdgo='cd ~/gocode/src'
alias push='git push origin HEAD'
alias ls='gls --color=auto'
alias ij='open -b com.jetbrains.intellij'

function sshi() {
  command echo "executed 'ssh -i ~/.ssh/$1 $2'"
  command ssh -i ~/.ssh/$1 $2
}

function history-all {
  history -E 1
}

# completsions
if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

autoload -U compinit
compinit
