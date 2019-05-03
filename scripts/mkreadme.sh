#!/usr/bin/env bash
set -exuo pipefail

TOPLEVEL="$( cd "$(dirname "$0")" ; pwd -P )/../"

# install plugin
sudo pip install --upgrade -e "${TOPLEVEL}"

cat <<EOF > "${TOPLEVEL}/README.md"
# pdml2flow-frame-inter-arrival-time [![PyPI version](https://badge.fury.io/py/pdml2flow-frame-inter-arrival-time.svg)](https://badge.fury.io/py/pdml2flow-frame-inter-arrival-time) 
_Calculates frame inter arrival times_

| Branch  | Build  | Coverage |
| ------- | ------ | -------- |
| master  | [![Build Status master]](https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time) | [![Coverage Status master]](https://coveralls.io/github/Enteee/pdml2flow-frame-inter-arrival-time?branch=master) |
| develop  | [![Build Status develop]](https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time) | [![Coverage Status develop]](https://coveralls.io/github/Enteee/pdml2flow-frame-inter-arrival-time?branch=develop) |

## Prerequisites

$( cat "${TOPLEVEL}/.travis.yml" | 
    sed -n -e '/# VERSION START/,/# VERSION END/ p' |
    sed -e '1d;$d' |
    tr -d \'\"  |
    sed -e 's/\s*-\(.*\)/  -\1/g' |
    sed -e 's/python/\* [python\]/g'
)
* [pip](https://pypi.python.org/pypi/pip)

## Installation

\`\`\`shell
$ sudo pip install pdml2flow-frame-inter-arrival-time
\`\`\`

## Usage

\`\`\`shell
$(python "${TOPLEVEL}/plugin/plugin.py")
\`\`\`

## Example

[pdml2flow]: https://github.com/Enteee/pdml2flow
[python]: https://www.python.org/
[wireshark]: https://www.wireshark.org/

[Build Status master]: https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time.svg?branch=master
[Coverage Status master]: https://coveralls.io/repos/github/Enteee/pdml2flow-frame-inter-arrival-time/badge.svg?branch=master
[Build Status develop]: https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time.svg?branch=develop
[Coverage Status develop]: https://coveralls.io/repos/github/Enteee/pdml2flow-frame-inter-arrival-time/badge.svg?branch=develop
EOF
