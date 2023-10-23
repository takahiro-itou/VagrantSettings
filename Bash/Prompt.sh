
function get_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git[\1]/'
}

function get_hg_branch {
    HGBR=$(hg branch 2> /dev/null) && echo "hg[${HGBR}]"
}

PS1_BASE='\n\[\033[46m\][\t \d \u@\h \w]\[\033[0m\] '
PS1_BRANCH="\$(get_git_branch)"

if [ "x${MYBASH_PROMPT_HG_BRANCH}y" = "xTRUEy" ] ; then
    PS1_BRANCH="${PS1_BRANCH} \$(get_hg_branch)"
fi

PS1="${PS1_BASE} ${PS1_BRANCH} \n$ "

