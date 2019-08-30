#!/bin/sh -e
#
# supa - *S*erver *Up*date *A*

# call parameters
__script_params="$*"

. "./lib/installer.sh"

OS=$(uname -o)
if [ "$OS" != "GNU/Linux" ] && [ "$OS" != "Darwin" ] ; then #  && [ "$OS" != "linux-musl" ]
# if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "linux-musl" ]] || [[ "$OSTYPE" == "darwin" ]] ; then
  printf '%s\n' "Unsupported system"
  exit 1
else
  # store name of the script and directory call
  readonly _init_name="$(basename "$0")"
  readonly _init_directory=$(dirname "$(readlink -f "$0" || echo "$(echo "$0" | sed -e 's,\\,/,g')")")
fi

# set root directory
readonly _rel="${_init_directory}/.."

# directories
readonly _lib="${_rel}/lib"

. "${_lib}/installer.sh"

readonly _src="${_rel}/src"

. "${_src}/settings.sh"
. "${_src}/usage.sh"
. "${_src}/helpers.sh"
. "${_src}/main.sh"

readonly VERSION="v0.2.3"

echo "script params: ${__script_params}"

main "${__script_params}"

exit 0
