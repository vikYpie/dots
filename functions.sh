# File search
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

function google() {
  open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q=$*";
}
function github() {
  open /Applications/Google\ Chrome.app/ "https://github.com/$*";
}
function youtube() {
  open /Applications/Google\ Chrome.app/ "https://www.youtube.com/results?search_query=$*";
}
function port-ls() {
  lsof -i ":$1"
}

# mkdir and cd 
function take() { mkdir -p "$@" && cd "$_";}

function pserver() {
  if [ -z "$1" ]; then
    port=8000
  else
    port=$1
  fi
  echo "Serving HTTP on: http://localhost:$port"
  python -m SimpleHTTPServer $1
}

function cdd() {
  cd "./$(fzf)/.."
}

function vimf() {
  vim $(fzf)
}
# mkalias on the fly
############################
function mkalias() {
    if [ $3 ] ;then 
        echo  "#$3" >> "~/dots/autoalias.sh";
    fi
    echo  "alias $1=\"$2\"" >> "~/dots/autoalias.sh";

    source ~/.zshrc
}

# tree 
############################
# useage treel 2 ~/someDir
function treel() {
     tree -L $1 $2
}
function treela() {
     tree -La $1 $2
}

# Go to the open Finder window's path
function cdf {
    target=`osascript -e 'tell application "Finder" to get POSIX path of (target of front Finder window as text)'`
    if [[ "$target" != "" ]]; then
        cd "$target"; echo "Going to $target"
    else
        echo -e 'There are no Finder windows!' >$2
    fi
}

# Case sensitive grep
function search {
    egrep --color --mmap --exclude=tags --exclude=Session.vim --exclude=*.{png,jpg,gif} \
        --exclude-dir=backup --exclude-dir=.{git,svn,hg} --exclude-dir=*.xcodeproj -HIrn $1 .
}

# Case insensitive grep
function isearch {
    egrep --color --mmap --exclude=tags --exclude=Session.vim --exclude=*.{png,jpg,gif} \
        --exclude-dir=backup --exclude-dir=.{git,svn,hg} --exclude-dir=*.xcodeproj -HIrin $1 .
}

# Full screen Vim help page.
function :h () {
    vim +"h $1" +only;
}

# Copy current git commit sha1 to the clipboard.
function gcopy() {
    git rev-parse --short @ | tr -d '\n' | pbcopy && echo "Copied `pbpaste`"
}

# git commit browser. needs fzf
log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

# whois a domain or a URL
function whois() {
	local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
	if [ -z $domain ] ; then
		domain=$1
	fi
	echo "Getting whois record for: $domain …"

	# avoid recursion
					# this is the best whois server
													# strip extra fluff
	/usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
	if [ -f "$1" ] ; then
		local filename=$(basename "$1")
		local foldername="${filename%%.*}"
		local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
		local didfolderexist=false
		if [ -d "$foldername" ]; then
			didfolderexist=true
			read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
			echo
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				return
			fi
		fi
		mkdir -p "$foldername" && cd "$foldername"
		case $1 in
			*.tar.bz2) tar xjf "$fullpath" ;;
			*.tar.gz) tar xzf "$fullpath" ;;
			*.tar.xz) tar Jxvf "$fullpath" ;;
			*.tar.Z) tar xzf "$fullpath" ;;
			*.tar) tar xf "$fullpath" ;;
			*.taz) tar xzf "$fullpath" ;;
			*.tb2) tar xjf "$fullpath" ;;
			*.tbz) tar xjf "$fullpath" ;;
			*.tbz2) tar xjf "$fullpath" ;;
			*.tgz) tar xzf "$fullpath" ;;
			*.txz) tar Jxvf "$fullpath" ;;
			*.zip) unzip "$fullpath" ;;
			*) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# animated gifs from any video
# from alex sexton   gist.github.com/SlexAxton/4989674
gifify() {
  if [[ -n "$1" ]]; then
	if [[ $2 == '--good' ]]; then
	  ffmpeg -i "$1" -r 10 -vcodec png out-static-%05d.png
	  time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$1.gif"
	  rm out-static*.png
	else
	  ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
	fi
  else
	echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
	if [ -t 0 ]; then # argument
		python -mjson.tool <<< "$*" | pygmentize -l javascript;
	else # pipe
		python -mjson.tool | pygmentize -l javascript;
	fi;
}

# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}


# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}


function port-kill() {
  port=$1

  if [[ ${#port} == 0 ]]; then
   echo "Kills a service running on the specified port."
   echo "usage: killport PORT"
   exit;
  fi

  # Get everything running on this port
  lsofcmd="lsof -i :$port"

  # echo the command, and then iterate through each line of the output
  counter=0
  $(echo $lsofcmd) | while read -r line; do
    counter=$((counter+1)) # We want to skip the first line, as the first line is the column headers, from lsof

    if [[ $counter > 1 ]]; then
      procname=$(echo $line | awk '{print $1}')
      pid=$(echo $line | awk '{print $2}')

      echo "Killing $procname with PID: $pid"
      kill $pid;
    fi
  done
}

function psgrep() {
  ps aux | grep "$1" | grep -v 'grep'
}


function pskill () {
  [ ${#} -eq 0 ] && echo "usage: $FUNCNAME STRING" && return 0 local pid
  pid=$(ps ax | grep "$1" | grep -v grep | awk ‘{ print $1 }’) echo -e "terminating ‘$1’ / process(es):\n$pid"
  kill -SIGTERM $pid
}
