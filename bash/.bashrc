#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cd='z'
alias cat='bat --style=plain --pager never'
PS1='[\u@\h \w]\$ '

# gpu encode and decode
export VDPAU_DRIVER="nvidia"
export LIBVA_DRIVER_NAME="nvidia"

# DLSS and RTX
export VKD3D_CONFIG=dxr11,dxr
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1

# zoxide
eval "$(zoxide init bash)"

# fzf
eval "$(fzf --bash)"

# chrome exec
export CHROME_EXECUTABLE="/usr/bin/brave"

# ruby
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

# haskell
[ -f "/home/lavi/.ghcup/env" ] && . "/home/lavi/.ghcup/env" # ghcup-env

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rust
. "$HOME/.cargo/env"

# flutter
export PATH="$HOME/flutter/bin:$PATH"

# Created by `pipx` on 2024-05-22 16:58:12
export PATH="$PATH:/home/lavi/.local/bin"

~/loginScript

