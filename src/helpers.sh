#!/bin/sh
#
# helpers

get_args() {
  if [ -z "$1" ]; then
    usage
    exit 0
  fi

  # local POSITIONAL=()
  while [ "$#" -gt 0 ]
  do
    key="$1"

    case "$key" in
      -D|--debug)
        DEBUG=1
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      -t|--target)
        TARGET="$2"
        shift 2
        ;;
      -V|--version)
        printf '%s\n' "$VERSION"
        exit 0
        ;;
      self)
        if [ -z "$2" ]; then
          self_usage
          exit 0
        fi

        self_key="$2"

        case "$self_key" in
          -h|--help)
            self_usage
            exit 0
            ;;
          rm|remove)
            uninstall
            exit 0
            ;;
          up|upgrade)
            upgrade
            exit 0
            ;;
          *)
            self_usage
            exit 0
            ;;
        esac
        exit 0
        ;;
      *)
        # get environment directory
        if [ -n "$1" ]; then
          ENVIRONMENT_DIR="$1"
        fi
        # POSITIONAL+=("$1")
        # shift

        if [ -n "${TARGET}" ]; then
          cmd_key="$3"
        else
          cmd_key="$2"
        fi

        case "$cmd_key" in
          restart)
            restart_env "$@"
            exit 0
            ;;
        esac

        pass_args_dc "$@"
        exit 0
        ;;
    esac
  done
  # set -- "${POSITIONAL[@]}"
}
