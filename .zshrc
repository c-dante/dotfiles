# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ ! -s $HOME/.antigen/antigen.zsh ] && git clone https://github.com/zsh-users/antigen.git .antigen
[ -s $HOME/.antigen/antigen.zsh ] && source $HOME/.antigen/antigen.zsh # This loads antigen

antigen bundle nojhan/liquidprompt

export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
[ -s $HOME/.nvm/nvm.sh ] && source $HOME/.nvm/nvm.sh # This loads NVM

alias ls='ls --color=auto'
alias vi='vim'
alias hg='hg --color=always'
alias less='less -r'
alias diff='colordiff -u'
alias sudo='sudo -E '
alias gti='git'
