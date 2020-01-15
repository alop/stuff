# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export HOMEBREW_NO_ANALYTICS=1
source ~/.git-prompt.sh
export CLICOLOR=1
export EDITOR=vim
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
ulimit -n 4096
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color | xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[00;34m\]\u\[\e[0m\]\[\e[00;32m\]@\[\e[0m\]\[\e[00;34m\]\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;34m\]\w\[\e[0m\]\[\e[00;37m\]\n\[\e[0m\]\[\e[00;32m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;31m\]\\$\[\e[0m\]\[\e[00;37m\]\[\e[0m\] $(__git_ps1 " (%s)") '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w \T\[$(tput sgr0)\]$(__git_ps1 " (%s)")$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
#export HOMEBREW_GITHUB_API_TOKEN="0e6b00af0fdb1a52e221ea046ef8de88ed1f4c1b"
export GITHUB_TOKEN="bbfceb8cf82636d7399f846f3cfa6b96967e20f3"
#export GITHUB_TOKEN="525fc01a4a6a2184bbf32092e662a03c08183128"
source ~/.git-completion.bash
eval $(ssh-agent)

function cleanup {
    echo "Killing SSH-Agent"
    kill -9 $SSH_AGENT_PID
}

trap cleanup EXIT

##
# Your previous /Users/abelopez/.bash_profile file was backed up as /Users/abelopez/.bash_profile.macports-saved_2015-08-01_at_12:43:14
##

# MacPorts Installer addition on 2015-08-01_at_12:43:14: adding an appropriate PATH variable for use with MacPorts.
export PATH="/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/opt/local/bin:/opt/local/sbin:$GOROOT/bin:$GOPATH/bin"
# Finished adapting your PATH environment variable for use with MacPorts.
PRINTER=Brother_HL_L2380DW_series
ssh-add -K &>/dev/null

# Ansible-systems proxmox password vault
export ANSIBLE_VAULT_PASSWORD_FILE="~/.config/engx-ansible"
#export ANSIBLE_VAULT_PASSWORD_FILE="~/.config/ansible-systems/vault-proxmox.pass"
#export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/ciscolabs-staging/config:$HOME/ccp-tenant/config
export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/prod/abelopez.kubeconfig:~/.kube/prod/admin.conf
export CX_ROOT=/Users/abelopez/go/src/wwwin-github.cisco.com/CPSG/ccp

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
