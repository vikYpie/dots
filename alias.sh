alias ls="ls -GAp"
alias dirs='dirs -v'
alias t="tig"
# https://forums.swift.org/t/swift-repl-starts-with-error-when-homebrew-python-is-installed/12927/8
alias sswift="PATH=/usr/bin:$PATH swift"
alias sozsh="source ~/.zshrc"
alias vim-install-boundle="vim +BundleInstall! +BundleClean +q"
alias vbundles="vim ~/.vimrc.bundles.local"
alias vi="vim"
alias desk="cd ~/Desktop"
alias valias="vim ~/dots/alias.sh"
alias untar="tar xzf"
alias rrm="rm -rf"
alias cpp="cp -Rp"
alias treep="tree --noreport -fp"
alias treepa="tree --noreport -fpa"
alias ghc-sandbox="ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias ghci-sandbox="ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias runhaskell-sandbox="runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias yd="youtube-dl"
alias py2=python
alias py=python3
#alias for 'brew services'
alias oaf="open -a Finder"
alias chrome="open -a Google\ Chrome"
alias safari="open -a Safari"
alias if0="ifconfig en0"
alias find-files="mdfind -onlyin"
#log
alias openssl-gen="openssl req -x509 -days 365 -newkey rsa:1024 -out my.cert -keyout my.key"
alias lsof-ports="lsof -iTCP -sTCP:LISTEN -n -P"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=aut'

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
