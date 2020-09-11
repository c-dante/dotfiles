# profile zsh start
# zmodload zsh/zprof

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dante/.zshrc'

fpath=($fpath ~/.zsh/completion)

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH
export TERM=xterm-256color
export PATH=~/bin:/home/dante/.cargo/bin:~/scratch/confluent-3.3.0/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=~/.local/bin:$PATH

# Add in caskroom for gcloud
export PATH=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH

[ ! -s $HOME/.zinit/zinit.zsh ] && git clone https://github.com/zdharma/zinit.git ~/.zinit
[ -s $HOME/.zinit/zinit.zsh ] && source $HOME/.zinit/zinit.zsh # This loads antigen


zinit light zsh-users/zsh-autosuggestions
zinit light nojhan/liquidprompt
zinit snippet OMZ::lib/termsupport.zsh

# configure autosuggests
# ctrl-space to accept suggestion
bindkey '^ ' autosuggest-accept

# allow less to display utf-8 characters
export LESSCHARSET=utf-8
export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
zinit light lukechilds/zsh-nvm # This load nvm on first use of node, npm, etc


export PYENV_VIRTUALENV_DISABLE_PROMPT=0
zinit light davidparsson/zsh-pyenv-lazy
zinit light kadaan/zsh-pyenv-virtualenv-lazy

# LS colors for bsd/linux
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

if ! [ $DISABLE_ALIAS ]; then
alias ls='ls -Glh'
alias ll='ls -Galh'
alias vi='vim'
alias hg='hg --color=always'
alias less='less -R'
alias diff='colordiff -u'
alias sudo='sudo -E '
alias gti='git'
alias gitp='git'
alias gi='git'
alias docker-exec='docker exec -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM'
alias env='env | sort | awk -F = '"'"'{ print "\033[1;35m" $1 "\033[0m = " $2; }'"'"''
alias ls-ln='find node_modules -maxdepth 1 -type l -ls'
fi

# fzf default command to ripgrep
if type "rg" > /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi

# multi-mv
autoload -U zmv
alias mmv='noglob zmv -W'

#search history
bindkey '^r' history-incremental-search-backward

#open vim in ctrl-p using ctrlp
ctrlp() {
  </dev/tty vim -c CtrlP
}
zle -N ctrlp
bindkey "^p" ctrlp

# fzf in shell with ctrl-t
[ -s /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -s /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

#open vim in ctrl-p using ctrlp
ctrla() {
  </dev/tty vim -c Grepper
}
zle -N ctrla
bindkey "^a" ctrla

# vi mode in right prompt
function zle-line-init zle-keymap-select {
	VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=2

# option + arrows for history completion
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# shift + option + arrows to jump line
bindkey "^[[1;10C" end-of-line
bindkey "^[[1;10D" beginning-of-line

# Custom escape code iTerm2 for opt + backspace
bindkey "^[optbksp" backward-kill-word

# In Vim backspace doesn't stop at the point where you started insert mode:
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# delete key
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# easier up and down
bindkey "^k" up-line-or-history
bindkey "^j" down-line-or-history

# home and end
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# set psql
export PSQL_EDITOR=vim
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if [ 1 ]; then source <(kubectl completion zsh); fi
if [  ]; then source <(argocompletion zsh); fi
eval export PATH="/Users/federici/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.3/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

[ -s $HOME/.envrc.sh ] && source $HOME/.envrc.sh

# Perfomance for zinit
# zprof
