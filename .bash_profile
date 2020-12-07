#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /Users/federici/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/federici/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
