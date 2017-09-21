#!/bin/bash
# preinstall:
#   @/bin/bash ./scripts/bootstrap.sh
#   cp scripts/prepare-commit-msg .git/hooks/prepare-commit-msg
#
# bootstrap:  ## Bootstrap a new developer machine
# bootstrap: checkinstall yarninstall
check="✓"

function ensure_dep() {
  printf " Looking for $1..."
  if [ ! "$(which $1)" ]; then
    echo "You need to install $1: $2"
    exit 1
  fi
  echo " $check"
}

function ensure_reach_local() {
  printf " Adding entry for reach.rackspace.local..."
  entry="127.0.0.1 reach.rackspace.local"
  grep -q -F "$entry" /etc/hosts || sudo sh -c "echo $entry >> /etc/hosts" || exit 1;
  echo " $check"
}

function check_install_mac() {
  ensure_dep "git" "Run xcode-select --install"
  ensure_dep "brew" "https://brew.sh/"
  ensure_dep "foreman" "gem install bundler && bundle install"
  ensure_dep "java" "brew cask install java"
  ensure_dep "docker" "https://store.docker.com/editions/community/docker-ce-desktop-mac"
}

ensure_reach_local

if [ $(uname -s) == "Darwin" ]; then
  check_install_mac
else
  check_install_linux
fi
