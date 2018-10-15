# set up prompt (with VCS info)
source ~/.zsh/prompt.zsh

# set up completion
zmodload zsh/complist
autoload -U compinit && compinit

### If you want zsh's completion to pick up new commands in $path automatically
### comment out the next line and un-comment the following 5 lines
#zstyle ':completion:::::' completer _complete _approximate
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1 # Because we didn't really complete anything
}
zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

#### key bindings
bindkey -e
bindkey "^R" history-incremental-search-backward
bindkey "^F" history-incremental-search-forward
bindkey  "[A" up-line-or-history
bindkey  "[B" down-line-or-history
bindkey  "[F" end-of-line
bindkey  "[4~" end-of-line
bindkey  "[H" beginning-of-line
bindkey  "[1~" beginning-of-line

### some blessings
setopt nobeep auto_cd complete_in_word nonomatch auto_pushd
#setopt correct
unsetopt correctall

### devtodo program
if [ -x /usr/bin/devtodo ]; then
  DEVTODO()
  {
    devtodo --timeout --summary
  }
  cd()
  {
    if builtin cd "$@"; then
      DEVTODO
    fi
  }
  pushd()
  {
    if builtin pushd "$@"; then
      DEVTODO
    fi
  }
  popd()
  {
    if builtin popd "$@"; then
      DEVTODO
    fi
  }
  # Run todo initially upon login
  DEVTODO
fi

### SSH-AGENT
#SSHAGENT=/usr/bin/ssh-agent
#SSHAGENTARGS="-s"
#if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
#  eval `$SSHAGENT $SSHAGENTARGS`
#  trap "kill $SSH_AGENT_PID" 0
#fi

# SSH-PAGEANT
if [ -z "$SSH_AUTH_SOCK" -a -x /usr/bin/ssh-pageant ]; then
  eval $(/usr/bin/ssh-pageant -q)
fi
trap logout HUP

## (de-)activate virtualenv's automagically
#chpwd()
#{
#  setopt localoptions extendedglob
#  local venvs
#  # find nearest .venv file in parent directories
#  venvs=( (../)#.venv(#q[-1]N:a:h) )
#  if [[ ${#venvs} -ne 0 ]]; then
#    # directory containing the file
#    local basedir=${venvs[1]}
#    # read environment directory from first line
#    local envname=$(head -n1 $basedir/.venv)
#    # make it absolute
#    [[ $envname != "/*" ]] && envname=$basedir/$envname
#    envname=( $envname(:a) )
#    # if the env exists and has not already been activated, do so
#    if [[ -r $envname/bin/activate && "x$envname" != "x$VIRTUAL_ENV" ]]; then
#      source $envname/bin/activate
#    fi
#  else
#    # if using virtual env but no .venv file, deactivate
#    [[ -n "$VIRTUAL_ENV" ]] && deactivate
#  fi
#}

# virtualenv-wrapper
source $HOME/.local/bin/virtualenvwrapper.sh
