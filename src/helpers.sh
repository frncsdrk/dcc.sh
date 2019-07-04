#!/usr/bin/env bash
#
# helpers

usage() {
  cat << EOF
dcc.sh

Usage:
  dcc.sh <user>@<host> [-h|--help] [-v|--version] [-d|--debug]

  dcc.sh up|upgrade

Options:
  -d|--debug
          enable debug mode

  -h|--help
          show this message

  -V|--version
          version

  up|upgrade
          upgrade dcc.sh

Examples:
  dcc.sh -V
          display version

  dcc.sh -h
          display this message

  dcc.sh upgrade
          upgrade dcc.sh to latest version

EOF
}

get_args() {
  if [[ -z $1 ]]; then
    usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -d|--debug)
        DEBUG=1
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      -V|--version)
        printf '%s\n' "$VERSION"
        exit 0
        ;;
      up|upgrade)
        upgrade
        exit 0
        ;;
      *)
        # get operator
        if [[ $1 =~ ^.+@.+$ ]]; then
          OPERATOR="$1"
        fi
        POSITIONAL+=("$1")
        shift
        ;;
    esac
  done
  set -- "${POSITIONAL[@]}"
}
