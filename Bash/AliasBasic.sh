
##
##  基本的なエイリアスの設定。
##
##  @file   Bash/AliasBasic.sh
##
##  Copyright (C) 2014/07,  Takahiro Itou.
##  All Rights Reserved.
##

alias  ll='ls -l --color=tty'
alias  la='ls -a --color=tty'
alias  ls='ls --color=tty'

alias  rm='rm -i'
alias  view='vim -R '

if [ "x${MYBASH_ECHO_LOADING_BASHRC_DETAIL}y" = "xTRUEy" ] ; then
  echo  "Loading  ${HOME}/Settings/Bash/AliasBasic.sh : OK"  1>&2
fi

