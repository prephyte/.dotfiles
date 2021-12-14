export ZSH="/home/prephyte/.oh-my-zsh"
ZSH_THEME="jreese"
ZSH_DISABLE_COMPFIX="true"
setopt NO_NOMATCH
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
alias venv="source .venv/bin/activate"
alias svim="sudoedit"
