# Path to your oh-my-zsh installation.
export USER_NAME="vimniky"
export ZSH=/Users/vimniky/.oh-my-zsh
PATH="$PATH:/Applications/racket/bin:$HOME/bin:."
PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH

# Make vim the default editor.
export EDITOR='vim';
export editor=vim

# Change defalult Homebrew Bottles sources
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PATH="$PATH:$HOME/.yarn/bin"

# If you installed the SDK via Homebrew, otherwise ~/Library/Android/sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

export TERM=xterm-256color
## fzf setting
export FZF_DEFAULT_OPTS='--reverse'

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# cheat
export CHEATCOLORS=true

export CDPATH=~/Desktop:~/projects:~/dev
# ingnore cotinues duplicated commands
# export HISTCONTROL=ignoredups
# squish duplicated history commands
export HISTCONTROL=erasedups
export HISTIGNORE="pwd:ls:ls –ltr:ls -a:ll:vim:cd:z:history:echo:cat"

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/flutter-dev/flutter/bin"
