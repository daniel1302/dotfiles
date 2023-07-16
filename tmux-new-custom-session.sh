#!/bin/bash

session="tmux-new-custom-session"


tmux new-session -d -s $session

tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www
tmux new-window -d -t "=$session" -c ~/www

# attach session
[ -n "${TMUX:-}" ] &&
    tmux switch-client -t "=$session" ||
    tmux attach-session -t "=$session"