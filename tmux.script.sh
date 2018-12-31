SESSION=DEV
tmux new-session -d -s $SEESSION
tmux new-window -t $SESSION:1 -n 'webserver'

tmux select-window -t $SESSION:1
# split window horizontally
tmux split-window -h

# tmux send-keys `cd ${HOME}/projects/esean-ui; npm start` C-m
# tmux attach -t $SESSION
