# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
unsetopt beep
# bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dante/.zshrc'

fpath+=~/.zfunc
fpath=($fpath ~/.zsh/completion)

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=/home/dante/bin:$PATH
export TERM=xterm-256color
export PATH=/home/dante/bin:/home/dante/.cargo/bin:/home/dante/scratch/confluent-3.3.0/bin:$PATH

# Set unicode charset
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

[ ! -s $HOME/.antigen/antigen.zsh ] && git clone https://github.com/zsh-users/antigen.git .antigen
[ -s $HOME/.antigen/antigen.zsh ] && source $HOME/.antigen/antigen.zsh # This loads antigen

antigen bundle nojhan/liquidprompt
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle extract
antigen apply

# configure autosuggests
# ctrl-space to accept suggestion
bindkey '^ ' autosuggest-accept


# Prevent banners in some npm packages
export ADBLOCK=true

export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
[ -s $HOME/.nvm/nvm.sh ] && source $HOME/.nvm/nvm.sh # This loads NVM

alias ls='ls --color=auto'
alias ll='ls -l'
alias vi='vim'
alias hg='hg --color=always'
alias less='less -r'
alias diff='colordiff -u'
alias sudo='sudo -E '
alias grep='grep --color=auto '
alias gti='git'
alias gt='git'
alias got='git'
alias gut='git'
alias gitp='git'
alias gg='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%an%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %h%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias docker-exec='docker exec -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM'
alias env='env | sort | awk -F = '"'"'{ print "\033[1;35m" $1 "\033[0m = " $2; }'"'"''
alias open='xdg-open'

export WINEARCH=win32

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

# vi mode in right prompt
# function zle-line-init zle-keymap-select {
#	VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#	zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
export KEYTIMEOUT=2

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

# ctrl + arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}" forward-char

# set psql
export PSQL_EDITOR=vim
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf

[ -s /usr/share/fzf/key-bindings.zsh ] && \. /usr/share/fzf/key-bindings.zsh
[ -s /usr/share/fzf/completion.zsh ] && \. /usr/share/fzf/completion.zsh
if type "rg" > /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
fi
