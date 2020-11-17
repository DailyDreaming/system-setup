# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

clear
python3 /usr/local/bin/quote_of_the_day.py | lolcat

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GOROOT=/usr/local/go
export GOPATH=/home/quokka/Projects/Proj1
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$PATH:/opt/pycharm-2019.2/bin:/opt/deadbeef:/opt/elasticsearch/bin
export DSS_TEST_ES_PATH=/opt/elasticsearch/bin/elasticsearch
export GOOGLE_APPLICATION_CREDENTIALS=/home/quokka/.credentials/platform-dev.json

alias sudo='sudo '
alias l='ls -lha'
alias c='clear && source ~/.bashrc'
alias kubectl='/usr/bin/kubectl '
alias heptio-authenticator-aws='aws-iam-authenticator '
alias dk='docker kill "$(docker ps -q)" &> /dev/null'
# https://wikileaks.org/ciav7p1/cms/page_1179773.html
alias gitfix='git commit --amend -C HEAD'
alias daily-quote='python3 /usr/local/bin/quote_of_the_day.py | lolcat'

# toil
alias gittoil='git clone https://github.com/DataBiosphere/toil.git && cd toil'
alias mktoil='git clone https://github.com/DataBiosphere/toil.git && cd toil && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && make prepare && make develop extras=[all]'
mktoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1" && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && make prepare && make develop extras=[all]; }
gittoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1"; }

g() { grep -r "$1" .; }
ppjson() { cat "$1" | jq ''; }
git-diff() { git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative origin/$1..origin/$2; }
gs-json() { python3 /usr/local/bin/gs_json.py "$1"; }
switch() { python3 /usr/local/bin/switch.py "$1"; if [ "$1" = "hca-dev" ]; then export GOOGLE_APPLICATION_CREDENTIALS=/home/quokka/.credentials/hca-dev.json; fi;  if [ "$1" = "hca-prod" ]; then export GOOGLE_APPLICATION_CREDENTIALS=/home/quokka/.credentials/hca-prod.json; fi }
h() { history | grep -i "$1"; }
switch-terraform() { wget https://releases.hashicorp.com/terraform/${1}/terraform_${1}_linux_amd64.zip && sudo unzip ./terraform_${1}_linux_amd64.zip -d /usr/local/bin/ && sudo chmod +x /usr/local/bin/terraform && sudo rm terraform_${1}_linux_amd64.zip && terraform version; }
kill-port() { sudo kill -9 $(sudo lsof -t -i:$1); }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ignore the PS1 fiddling based on deprecated nonsense above this; we're ubuntu 18.04 damn it
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[00;33m\]\@\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$ "

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# backup filename only records the day, so is overwritten if and only if same day
# these should be, eventually, MANUALLY, cleaned up
BACKUP=$HISTFILE.backup.$(date +%F)
if [ -s "$HISTFILE" -a "$HISTFILE" -nt "$BACKUP" ]; then
  # history file is newer then backup
  cp -f $HISTFILE $BACKUP
fi
