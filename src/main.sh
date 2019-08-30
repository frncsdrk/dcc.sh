#!/bin/sh
#
# main

restart_env() {
  if [ -n "$DEBUG" ]; then
    echo "restart_env"
    echo "$@"
  fi

  if [ "$3" = "--clean" ] || [ "$3" = "--clean" ]; then
    case_conditional=$2
  else
    case_conditional=$1
  fi

  cd "$1" || exit 1
  docker-compose stop -t 0
  # clean option
  if [ -n "$4"  ] && [ "$3" = "clean" ]; then
    docker-compose rm -f
  fi
  docker-compose up -d --remove-orphans
}

pass_args_dc() {
  if [ -n "${DEBUG}" ]; then
    echo "pass_args_dc"
    echo "$@"
  fi

  current_dir="${PWD}"

  if [ -n "${TARGET}" ]; then
    printf '%s\n' "target: ${TARGET}"
    for directory in $(cat "${current_dir}"/.dcc/"${TARGET}"); do
      printf '%s\n' "dir: ${directory}"
      if [ -d "${directory}" ]; then
        cd "${current_dir}/${directory}" || exit 1

        docker-compose "${@:1}" # 1 b/c shift in option

        cd "${current_dir}" || exit 1
      fi
    done
  else
    # use directory
    cd "$1" || exit 1
    docker-compose "${@:2}"
  fi
}

main() {
  get_args "$@"
}
