#!/bin/bash

target_dir=$1

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
pane_status+="#[bg=colour2,fg=colour0]${target_dir}#[default]"
pane_status+="#[bg=colour15,fg=colour13] ${git_info},${hg_info}#[default]"

echo "${pane_status}"
