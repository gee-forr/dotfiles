#!/bin/zsh
SESSION_NAME='dev'
tmux new-session -d -s $SESSION_NAME
tmux rename-window -t $SESSION_NAME:0 "REPL"

tmux new-window -n "Main" -t $SESSION_NAME:1
tmux new-window -n "Sec"  -t $SESSION_NAME:2
tmux new-window -n "Ter"  -t $SESSION_NAME:3
tmux new-window -n "Tmpl" -t $SESSION_NAME:4
tmux new-window -n "Conf" -t $SESSION_NAME:5
tmux new-window -n "Scr1" -t $SESSION_NAME:6
tmux new-window -n "Scr2" -t $SESSION_NAME:7
tmux new-window -n "Scr3" -t $SESSION_NAME:8
tmux new-window -n "Test" -t $SESSION_NAME:9

tmux split-window -h -t $SESSION_NAME:9
tmux select-window -t $SESSION_NAME:1

echo "New dev session created"
#tmux -2 attach-session -t $SESSION_NAME
