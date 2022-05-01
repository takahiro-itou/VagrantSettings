#!/bin/bash

target_dir=$1
pane_width=$2

if git_status=$(cd ${target_dir} && git status 2> /dev/null ); then
    git_branch=$(git branch --no-color 2> /dev/null | \
                     sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/');
    git_info="git[${git_branch}]"
else
    git_info=''
fi

if hg_branch=$(cd ${target_dir} && hg branch 2> /dev/null ); then
    hg_info="hg[${hg_branch}]"
else
    hg_info=''
fi

pane_status=''
pane_status+="#[bg=colour15,fg=colour13] ${git_info},${hg_info} #[default]"

repo_info_len=${#pane_status}
dir_name_max=$(( pane_width - repo_info_len - 8 ))
dir_name_len=${#target_dir}
dir_name=$(printf  "%-*s"  ${dir_name_max} "${target_dir}")
dir_info=${dir_name: -${dir_name_max}}

pane_status+="#[bg=colour2,fg=colour15]${dir_info}#[default]"

echo "${pane_status}"
