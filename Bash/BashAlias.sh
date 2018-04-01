
##
##  エイリアスの設定。
##
##  @file   Bash/BashAlias.sh
##
##  Copyright (C) 2014/07,  Takahiro Itou.
##  All Rights Reserved.
##

if [ -f ~/Settings/Bash/AliasBasic.sh ] ; then
  source  ~/Settings/Bash/AliasBasic.sh
fi

if [ "x${MYBASH_ECHO_LOADING_BASHRC_DETAIL}y" = "xTRUEy" ] ; then
  echo  "Loading  ${HOME}/Settings/Bash/BashAlias.sh : OK"  1>&2
fi

