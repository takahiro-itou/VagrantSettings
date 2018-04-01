
if [ "x${MYBASH_ECHO_LOADING_BASHPROFILE}y" = "xTRUEy" ] ; then
  echo  "Start  Loading : ${HOME}/Settings/Bash/BashProfile.sh"  1>&2
fi

if [ -f ~/Settings/Bash/Bashrc.sh ] ; then
  source  ~/Settings/Bash/Bashrc.sh
fi

if [ "x${MYBASH_ECHO_LOADING_BASHPROFILE}y" = "xTRUEy" ] ; then
  echo  "Loading  ${HOME}/Settings/Bash/BashProfile.sh : OK"  1>&2
fi

