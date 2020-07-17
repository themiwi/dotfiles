# set up prompt (with VCS info)
#fpath=($HOME/.local/faster-vcs-info $fpath)
#autoload -Uz vcs_info
#setopt prompt_subst
#zstyle ':vcs_info:*' enable git #svn
#zstyle ':vcs_info:*' actionformats '%F{magenta}[%s:%F{yellow}%b%f|%F{red}%a%F{magenta}]%f '
#zstyle ':vcs_info:*' formats       '%F{magenta}[%s:%F{yellow}%b%F{magenta}]%f '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%F{yellow}%r'
#precmd () {
#  vcs_info
#  if [ "${vcs_info_msg_0_}" = "" ]; then
#    dir_status="%f%#"
#  elif ! command git diff-index --cached --quiet HEAD >& /dev/null; then
#    dir_status="%F{red}▶%f"
#  elif ! command git diff-index --quiet HEAD >& /dev/null; then
#    dir_status="%F{yellow}▶%f"
#  else
#    dir_status="%F{cyan}▶%f"
#  fi
#  HOST=$(hostname)
#}
#PS1='%F{red}%n%f@%F{blue}%m %3~ ${vcs_info_msg_0_}${dir_status} '
#PS1='%F{blue}%3~ ${vcs_info_msg_0_}${dir_status} '
#PS1='%F{blue}%3~%f '
##PS1='%F{red}%n%f@%F{blue}%m %3~ %f%# '
#path=($path $HOME/.local/bin)
#source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh


#function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
#fi
