
##
##  基本的なエイリアスの設定。
##
##  @file   Bash/AliasBasic.sh
##
##  Copyright (C) 2014/07,  Takahiro Itou.
##  All Rights Reserved.
##

alias  g='git '
alias  gbr='git  branch '
alias  gci='git  commit '
alias  gco='git  checkout '
alias  gd='git  diff '
alias  gdc='git  diff  --cached '
alias  ggl='git  gll '
alias  ggll='git  gll '
alias  gglv='git  glv '
alias  gpo='git  push  origin '
alias  gpod='git  push  origin  develop'
alias  gpom='git  push  origin  master'
alias  gph='git  push  github '
alias  gphd='git  push  github  develop'
alias  gphm='git  push  github  master'
alias  gpb='git  push  bit '
alias  gpbd='git  push  bit  develop'
alias  gpbm='git  push  bit  master'
alias  gpl='git  push  local '
alias  gpld='git  push  local  develop'
alias  gplm='git  push  local  master'
alias  gst='git  status '

alias  ll='ls -l --color=tty'
alias  la='ls -a --color=tty'
alias  ls='ls --color=tty'

alias  rm='rm -i'
alias  view='vim -R '

alias  gitlogdate='sed -n -e "s/^Date: *//p"'
alias  gitlogauth='sed -n -e "s/^Author: *//p"'
alias  gitlastdate='git show | gitlogdate'
alias  gitlastauth='git show | gitlogauth'

alias  git_chmod_755='git  update-index  --chmod=+x '
alias  git_chmod_644='git  update-index  --chmod=-x '

if [ "x${MYBASH_ECHO_LOADING_BASHRC_DETAIL}y" = "xTRUEy" ] ; then
  echo  "Loading  ${HOME}/Settings/Bash/AliasBasic.sh : OK"  1>&2
fi

