#!/bin/sh
#
# usage

usage() {
  cat << EOF
dcc.sh

Usage:
  dcc.sh <directory|[-t|--target <target file name>]> [-h|--help] [-V|--version] [-D|--debug]
  [any docker-compose command] [restart] [self]

  dcc.sh self

Options:
  -D|--debug
          enable debug mode

  -h|--help
          show this message

  -t|--target
          pass target

  -V|--version
          version

  <directory> [any docker-compose command]
          execute docker compose command

  <directory> restart [-c|--clean]
          restart docker compose

  self
          self command

Examples:
  dcc.sh -V
          display version

  dcc.sh -h
          display this message

  dcc.sh -t all ps
          execute 'docker-compose ps' in directories listed in target file 'all'

  dcc.sh service/ ps
          execute 'docker-compose ps' in service directory

  dcc.sh service/ restart
          restart service docker compose w/o removing containers

  dcc.sh self upgrade
          upgrade dcc.sh to latest version

EOF
}
