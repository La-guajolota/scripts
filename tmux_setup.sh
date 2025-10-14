#!/bin/zsh

SESSION_NAME="chamba"

# Kill existing session if it exists
tmux kill-session -t $SESSION_NAME 2>/dev/null

# Create new session detached with stats window first
tmux new-session -d -s $SESSION_NAME -n "stats"
tmux send-keys -t "stats" 'btop' Enter

# Create a second window for chamba with layout
tmux new-window -n "chamba"
# Split window horizontally (creates left/right panes)
tmux split-window -h
# Split the left pane vertically (creates top-left/bottom-left)
tmux select-pane -t 0
tmux split-window -v
tmux select-pane -t 1 # Split the bottom-left pane again (creates 3 panes on left, 1 on right)
tmux split-window -v
# Resize panes to your preferred sizes
tmux resize-pane -t 0 -x 8 -y 3    # top-left pane
tmux resize-pane -t 1 -y 10          # middle-left pane
# Right pane (t 3) will auto-adjust
# Start your commands in each pane
tmux send-keys -t 0 'cava' Enter Right # Send right arrow to cava
tmux send-keys -t 1 'watch -n 180 speedtest-cli' Enter
tmux send-keys -t 2 'cmatrix' Enter
tmux send-keys -t 3 'fastfetch' Enter

# Cretate a third window for coding
tmux new-window -n "coding"
tmux split-window -v               

# Attach to session
tmux attach-session -t $SESSION_NAME
