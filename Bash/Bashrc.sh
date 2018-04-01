
if [ "x${MYBASH_ECHO_LOADING_BASHRC}y" = "xTRUEy" ] ; then
  echo  "Start  Loading : ${HOME}/Settings/Bash/Bashrc.sh"  1>&2
fi

if [ -f ~/Settings/Bash/Prompt.sh ] ; then
  source  ~/Settings/Bash/Prompt.sh
fi

if [ -f ~/Settings/Bash/BashAlias.sh ] ; then
  source  ~/Settings/Bash/BashAlias.sh
fi

if [ "x${MYBASH_ECHO_LOADING_BASHRC}y" = "xTRUEy" ] ; then
  echo  "Loading  ${HOME}/Settings/Bash/Bashrc.sh : OK"  1>&2
fi

