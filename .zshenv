### aliases
[[ -r ~/.zsh/aliases ]] && source ~/.zsh/aliases

### want Vim as editor
export EDITOR="vim"

### history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

# GPG
#export GPG_TTY=`tty`

# Vim as a pager
export PAGER=less
export MANPAGER=less

# grep options
GREP_OPTIONS='--color=auto'
GREP_COLOR='1;32'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(/usr/bin/dircolors -b)"
    alias ls='ls --color=auto'
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh /usr/bin/lesspipe)"

# Custom tools
path=($HOME/bin $path)
path=($HOME/.local/bin $path)

# Java/Maven
#path=(/drives/d/Software/Java/jdk1.7.0_71/bin $path)
#path=(/drives/d/Software/apache-maven-3.2.3/bin $path)
#export M2_HOME='D:\Software\apache-maven-3.2.3'
export JAVA_HOME='C:\Program Files\Java\jre1.7.0_55'
#alias mvn=mvn.bat

# create windows symlinks
CYGWIN=winsymlinks:nativestrict

VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
