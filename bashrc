# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export HISTCONTROL=ignoreboth
export HISTFILESIZE=4500

# Append to the history file, don't overwrite it
shopt -s histappend

HGUSER="Patrick Hetu"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

##################
# Code # Color   #
##################
#  00  # Off     #
#  30  # Black   #
#  31  # Red     #
#  32  # Green   #
#  33  # Yellow  #
#  34  # Blue    #
#  35  # Magenta #
#  36  # Cyan    #
#  37  # White   #
##################

# Dark colors: \[\033[0;??m\]
# Light colors: \[\033[1;??m\]

function color {
    echo "\[\033[$1;$2m\]"
}

c_prompt=`color 0 33`
c_path=`color 1 33`
c_branch=`color 1 32`
c_tag=`color 1 34`
c_off=`color 0 00`

#PS1="${c_prompt}[\u@\h ${c_path}\W$c_branch\$(git_branch)$c_tag\$(git_tag)${c_prompt}]${c_off} "

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

alias rls='/bin/ls --color=auto'
# some more ls aliases
alias ll='rls -l'
alias la='rls -A'
#alias l='rls -CF'

alias rm='rm -i'

# highlight $HOST:$PWD prompt
PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '
PS1="\[\033[G\]${PS1}"
#PS1='f$ '

# GREP_COLOR=bright yellow on black bg.
# use GREP_COLOR=7 to highlight whitespace on black terminals
# LANG=C for speed. See also: http://www.pixelbeat.org/scripts/findrepo
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

alias minicom='minicom -c on' #enable colour
alias c='cal -3' #show 3 months by default
alias units='units -t' #terse mode
alias diff='LC_ALL=C TZ=GMT0 diff -Naur' #normalise diffs for distribution
alias lynx='lynx -force_html -accept_all_cookies'
alias links='links -force-html' #need to enable colour in config menu manually
alias emacs="emacs -nw"
alias y="yokadi"
alias ly="yokadi -d ~/.lyokadi.db"
alias mv="mv -i"
alias cp="cp -i"

#Django command shortcuts
alias dj='python manage.py'
alias djr='dj runserver'
alias djrp='dj runserver_plus'
alias djdb='dj dbshell'
alias djs='dj shell'
alias djsp='dj shell_plus'
alias djt='dj test'
alias djm='dj migrate'
alias djsm='dj startmigration'

alias ai='sudo apt-get install'
alias au='sudo apt-get update'
alias ad='sudo apt-get dist-upgrade'

#quick dir listing, latest files/dirs at the bottom
alias l="rls -lrt"

#just list directories
alias lld='rls -lUd */'

#what most people want from od (hexdump)
alias hd='od -Ax -tx1z -v'

# canonicalize path (including resolving symlinks)
alias realpath='readlink -f'

alias u="cd .."
alias ".."="cd .."
alias bd='. bd -s'

#alias tmux="TERM=screen-256color-bce tmux"

export PAGER=less
export EDITOR=vim
export DEBFULLNAME='Patrick Hetu'
export DEBEMAIL='patrick.hetu@gmail.com'
export QUILT_PATCHES=debian/patches
export TERM="xterm-256color"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GOPATH=$HOME/repos/go
export PATH=$PATH:$GOPATH/bin
export MAXCPUS=4

bind 'set completion-ignore-case on'
