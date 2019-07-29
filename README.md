# dcc.sh

> docker compose companion

## Usage

```
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

```

### Target files

You can create text files in the directory `.dcc/`, containing a list of directories one on each line.
The targets name equals the name of the target file.

example:
```
service1/
service2/
```

## Bugs

none

## Installation

### automatically

Run `curl https://raw.githubusercontent.com/frncsdrk/dcc.sh/master/download.sh -sSf | sudo bash`

### manually

- clone the repo
- run `./setup.sh i` (requires `sudo`)

## License

[MIT](https://github.com/frncsdrk/dcc.sh/blob/master/LICENSE) (c) frncsdrk 2019 - present
