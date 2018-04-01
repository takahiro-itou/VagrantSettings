
if [ "x${MYBASH_ECHO_LOADING_BASHRC}y" = "xTRUEy" ] ; then
  echo  "Start  Loading : ${HOME}/Settings/Bash/Bashrc.sh"  1>&2
fi

for  file  in  /etc/bashrc  ; do
  if [ -f ${file} ] ; then
    source  ${file}
  fi
done

if [ -f ~/Settings/Bash/SetEnvs.sh ] ; then
  source  ~/Settings/Bash/SetEnvs.sh
fi

if [ -f ~/Settings/Bash/Prompt.sh ] ; then
  source  ~/Settings/Bash/Prompt.sh
fi

if [ -f ~/Settings/Bash/BashAlias.sh ] ; then
  source  ~/Settings/Bash/BashAlias.sh
fi

if [ -f ~/LocalSettings/Bash/BashrcLocal ] ; then
  source  ~/LocalSettings/Bash/BashrcLocal
fi

if [ "x${MYBASH_ECHO_LOADING_BASHRC}y" = "xTRUEy" ] ; then
  echo  "Loading  ${HOME}/Settings/Bash/Bashrc.sh : OK"  1>&2
fi

