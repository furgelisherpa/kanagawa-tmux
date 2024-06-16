#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

battery="$current_dir/battery.sh"
date="$current_dir/date.sh"
time="$current_dir/time.sh"

left_sep=""
right_sep=""

sumilnk2="#2A2A37"
darkBlue="#252535"
lightBlue="#8ba4b0"
greyWhite="#c3c6c3"
dragonGray="#282727"
reddish="#c4746e"

bar_bg=$dragonGray
text_fg=$sumilnk2

session_bg=$bar_bg
session_fg=$greyWhite
session_active_bg=$session_fg
session_active_fg=$session_bg

window_active_fg=$text_fg
window_active_bg=$lightBlue
window_inactive_fg=$greyWhite
window_inactive_bg=$dragonGray

pane_active=$carpYellow
pane_inactive=$bar_bg

message_fg=$session_bg
message_bg=$greyWhite

time_bg=$window_active_bg
time_fg=$darkBlue
date_bg=$darkBlue
date_fg=$lightBlue

tmux set-window-option -g window-status-activity-style "bold"
tmux set-window-option -g window-status-bell-style "bold"
tmux set-option -g status-style "fg=$session_fg,bg=${bar_bg},bold,italics"
tmux set-option -g message-style "fg=${message_fg},bg=${message_bg}"
tmux set-option -g pane-active-border-style "fg=${pane_active}"
tmux set-option -g pane-border-style "fg=${pane_inactive}"
tmux set-window-option -g window-status-style "fg=${window_active_fg},bg=${window_active_bg},nobold,noitalics"
tmux set-window-option -g window-status-separator ""
tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

flags="#{?window_flags,#{?window_active,#[fg=${window_active_fg}],#[fg=${window_inactive_fg}]}#{window_flags},}"

tmux set-option -g status-left "#[bg=$session_bg]#{?client_prefix,#[fg=$session_active_fg],}#{?client_prefix,#[bg=$session_active_bg],} #S #[fg=${session_bg},bg=${bar_bg}]#{?client_prefix,#[fg=${session_active_bg}],}${left_sep}"

tmux set-window-option -g window-status-current-format "#[fg=${bar_bg}]${left_sep} #[fg=${window_active_fg},bg=${window_active_bg}]#I:#W #[fg=${window_active_bg},bg=${bar_bg}]${left_sep}"

tmux set-window-option -g window-status-format "#[fg=${bar_bg}]#[bg=${window_inactive_bg}]${left_sep}#[fg=${window_inactive_fg}]#[bg=${window_inactive_bg}] #I:#W ${flags}#[bg=${bar_bg}]${left_sep}"

tmux set-option -g status-right "#[bg=${bar_bg},noitalics,nobold]"

if [[ $($battery) != "0" ]]; then
  tmux set-option -ga status-right "#($battery) ${right_sep}#[fg=${date_fg},bg=${date_bg}] #($date) #[fg=${time_fg},bg=${time_bg}] #($time) "
else
  tmux set-option -ga status-right "#[fg=${date_fg},bg=${date_bg}] #($date) #[fg=${time_fg},bg=${time_bg}] #($time) "
fi
