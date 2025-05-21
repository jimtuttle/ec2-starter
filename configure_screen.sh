#!/usr/bin/env bash

# Create screen configuration and autostart
# https://linuxize.com/post/how-to-use-linux-screen/

# Install screen

sudo apt update && sudo apt install -y screen

# Install screen configuration file

cat >~/.screenrc <<EOF
hardstatus alwayslastline
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{=kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B}%Y-%m-%d %{W}%c %{g}]'
# Default screens
screen -t shell1        0
screen -t shell2        1
# Enable mouse scrolling and scroll bar history scrolling
termcapinfo xterm* ti@:te@
EOF

# Add screen autostart to bashrc

cat >>~/.bashrc <<'EOF'

# Start new screen session or connect to existing session on interactive login
# https://superuser.com/questions/224631/is-it-a-good-idea-to-put-screen-r-in-my-bashrc
case $- in
  *i*) screen -Rd;;
esac
EOF

# Load new bash configuration

source ~/.bashrc
