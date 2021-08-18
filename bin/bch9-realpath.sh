#!/usr/bin/env sh

# https://unix.stackexchange.com/questions/47710/find-only-destination-of-symlink``

bch_bash_realpath() {
  # print the resolved path
  # @params
  # 1: the path to resolve
  # @return
  # &1: the resolved link path
  local path="${1}"
  while [[ -L ${path} && "$(ls -l "${path}")" =~ -\>\ (.*) ]]
  do
    path="${BASH_REMATCH[1]}"
  done
  echo "${path}"
  exit
}

bch_bash_realpath "$@"
