
##
##  シェル用の関数。
##
##  @file   Bash/Function.sh
##
##  Copyright (C) 2019/05,  Takahiro Itou.
##  All Rights Reserved.
##

##################################################################
##
##   パスを変数に追加する
##
##  @param [in] $1    操作する変数名
##  @param [in] $2    追加するパス名
##  @param [in] $3    prepend を指定すると先頭に追加
##                    デフォルトは末尾に追加
###

function  add_path_to_var() {
    varName=$1

    # 追加するパス名の末尾のスラッシュを取り除く
    srcPath="${2%/}"

    # 変数の現在の値を取り出し、ゴミを取り除く
    # 先頭と末尾のコロン、連続するコロンを削除
    eval  pathList='$'${varName}
    eval  $varName="'$(echo ${pathList} | sed -r -e 's;:{2,};:;g' -e 's;^:|:$;;g')'"

    if [[ -d "${srcPath}" && $(echo ${pathList} | grep -c -E "(^|:)${srcPath}($|:)") -eq 0 ]]; then
        if [[ "$3" == "prepend" ]] ; then
            eval  ${varName}="'${srcPath}:${pathList}'"
        else
            eval  ${varName}="'${pathList}:${srcPath}'"
        fi
    fi
}


##################################################################
##
##
###

function  git_rebase_amend() {
    logAuth=$(git show | gitlogauth)
    logDate=$(git show | gitlogdate)
    cmdEnvs="env  GIT_COMMITTER_DATE='${logDate}'"
    command="${cmdEnvs}  git commit --amend -e  $1"
    echo  "${command}"
    eval  "${command}"
}

function  git_rebase_empty() {
    logAuth=$(git show | gitlogauth)
    logDate=$(git show | gitlogdate)
    cmdEnvs="env  GIT_COMMITTER_DATE='${logDate}'"
    command="${cmdEnvs}  git commit --allow-empty  $1"
    echo  "${command}"
    eval  "${command}"
}
