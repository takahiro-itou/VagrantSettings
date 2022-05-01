#!/bin/bash  -xue

if [ $1 = 'off' ] ; then
    tmux set-option    mouse off
    tmux set-option    status-right  \
         '[MouseOFF] %Y/%m/%d(%a) %H:%M:%S'
    tmux display-message 'Mouse Disabled'
else
    tmux set-option    mouse on
    tmux set-option    status-right  \
         '[Mouse ON] %Y/%m/%d(%a) %H:%M:%S'
    tmux display-message 'Mouse Enabled'
fi

tmux refresh-client -S
