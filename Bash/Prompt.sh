
function get_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git[\1]/'
}

function get_hg_branch {
    HGBR=$(hg branch 2> /dev/null) && echo "hg[${HGBR}]"
}

PS1_BASE='\n\[\033[42m\][\t \d \u@\h \w]\[\033[0m\] '
PS1_BRANCH="\$(get_git_branch) \$(get_hg_branch)"

PS1="${PS1_BASE} ${PS1_BRANCH} \n$ "

