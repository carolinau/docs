#!/bin/zsh
SITES=$(terminus site:list --fields=name --format=string | sort);
parallel --tmuxpane --fg --tag "terminus env:deploy {}.live --cc" ::: $SITES
