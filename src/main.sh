#!/usr/bin/env bash
#
# main

restart_env() {
  if [ ! -z "$DEBUG" ]; then
    echo "restart_env"
    echo "$@"
  fi

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
  if [ ! -z "${DEBUG}" ]; then
    echo "pass_args_dc"
    echo "$@"
  fi

  local current_dir="${PWD}"

  if [ ! -z "${TARGET}" ]; then
    for directory in "$(cat ${current_dir}/.dcc/${TARGET})"; do
      cd "${directory}"
      docker-compose "${@:2}"
      cd "${current_dir}"
    done
  else
    # use directory
    cd "$1"
    docker-compose "${@:2}"
  fi
}

main() {
  get_args "$@"
}
