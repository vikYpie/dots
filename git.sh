# alias
alias g="git"
alias gmm='git commit -m'
alias gma='git commit --amend'
alias git-confict-files="git diff  --diff-filter=U"
alias git-conflict='git diff --name-only --diff-filter=U'
alias git-diff-file-history="git log --follow -p"

function git-commit-dots() {
  cd ~/dots
  git add .
  if [ -z "$1" ]
  then
    git commit -m "$(date)"
  else
    git commit -m "$1"
  fi
  git push
}

function git-commit-emacsrc() {
  cd ~/.spacemacs.d
  git add .
  if [ -z "$1" ]
  then
    git commit -m "$(date)"
  else
    git commit -m "$1"
  fi
  git push
}

