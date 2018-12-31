# alias
alias vdocker="vim $HOME/dots/docker.sh"
alias d=docker
alias k=kubectl
alias dm="docker-machine"
alias dcom="docker-compose"
alias docker-volume-find-all-dangling="docker volume ls -f dangling=true"
alias docker-volume-rm-all-dangling="docker volume rm `docker volume ls -q -f dangling=true`"

# kubectl autocompeletion
source <(kubectl completion zsh)

# default listenning on port 9000
function docker-create-docker-ui() {
  if [ -z "$1" ]
  then
    docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock --name docker-ui portainer/portainer
  else
    docker run -d -p ${1}:${1} -v /var/run/docker.sock:/var/run/docker.sock --name docker-ui portainer/portainer
  fi
}

# functions
function dm-use() {
  if [ -z "$1" ]
  then
    eval $(docker-machine env default)
  elif [ "$1" == "formac" ]
  then
    docker-use-for-mac
  elif [ "$1" == "minikube" ]
  then
    eval $(minikube docker-env)
  else
    eval $(docker-machine env "$1")
  fi
  env | grep DOCKER
}

function docker-stop-all-containers() {
  docker stop $(docker ps -q)
}

function docker-use-for-mac() {
  unset DOCKER_TLS_VERIFY
  unset DOCKER_CERT_PATH
  unset DOCKER_MACHINE_NAME
  unset DOCKER_HOST
  unset DOCKER_API_VERSION
}
# backup volume
# sudo docker run --rm --volumes-from volume_container -v $(pwd):/backup ubuntu tar cvf /backup/data.tar /data

# remove all exited docker containers
function docker-rm-all-exited-containers() {
  docker rm -v $(docker ps -aq -f status=exited)
}

function docker-danger-rm-allcontaienrs() {
  docker ps -a -q | xargs --no-run-if-empty docker rm -f
}

#function docker-rm-containers() {
#  if [ -z "$1" ]
#  then
#    docker ps -a -q --filter status=exited | xargs --no-run-if-empty docker rm
#  elif [ "$1" == "all" ]
#  then
#    docker ps -a -q | xargs --no-run-if-empty docker rm -f
#  else
#    docker ps -a -q --filter status="$1" | xargs --no-run-if-empty docker rm
#}

function docker-rm-all-created-containers() {
  docker rm -v $(docker ps -aq -f status=created)
}

# list available users in an image
function docker-list-users() {
  docker run --rm "$1" awk -F: '$0=$1' /etc/passwd
}

alias docker-rm-dangling-volume="docker volume rm $(docker volume ls -f dangling=true -q)"
alias docker-rm-all-untagged-images="docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")"
