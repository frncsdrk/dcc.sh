#!/usr/bin/env bash
#
# main

restart_env() {
  echo "restart env"
  echo "$@"

  if [ "$3" == "--clean" ] || [ "$3" == "--clean" ]; then
    case_conditional=$2
  else
    case_conditional=$1
  fi

  cd "$1"
  docker-compose stop -t 0
  # clean option
  if [ -n $4  ] && [ "$3" == "clean" ]; then
    docker-compose rm -f
  fi
  docker-compose up -d --remove-orphans
}

pass_args_dc() {
  cd "$1"
  docker-compose "${@:2}"
}

main() {
  get_args "$@"
}
