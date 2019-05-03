# pdml2flow-frame-inter-arrival-time [![PyPI version](https://badge.fury.io/py/pdml2flow-frame-inter-arrival-time.svg)](https://badge.fury.io/py/pdml2flow-frame-inter-arrival-time) 
_[pdml2flow] Plugin to calculate frame inter arrival times_

| Branch  | Build  | Coverage |
| ------- | ------ | -------- |
| master  | [![Build Status master]](https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time) | [![Coverage Status master]](https://coveralls.io/github/Enteee/pdml2flow-frame-inter-arrival-time?branch=master) |
| develop  | [![Build Status develop]](https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time) | [![Coverage Status develop]](https://coveralls.io/github/Enteee/pdml2flow-frame-inter-arrival-time?branch=develop) |

## Prerequisites

* [python]:
  - 3.4
  - 3.5
  - 3.5-dev
  - nightly
* [pip](https://pypi.python.org/pypi/pip)

## Installation

```shell
$ sudo pip install pdml2flow-frame-inter-arrival-time
```

## Usage

```shell
usage: Calculate inter arrival times of frames in a flow or on an interface
       [-h] [--no_flow] [--frames]

optional arguments:
  -h, --help  show this help message and exit
  --no_flow   Calculate inter arrival time to the previous frame on the
              interface, not in the flow [default: False]
  --frames    Print the frames alongside the inter arrival time [default:
              False]
```

## Example

[pdml2flow]: https://github.com/Enteee/pdml2flow
[python]: https://www.python.org/
[wireshark]: https://www.wireshark.org/

[Build Status master]: https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time.svg?branch=master
[Coverage Status master]: https://coveralls.io/repos/github/Enteee/pdml2flow-frame-inter-arrival-time/badge.svg?branch=master
[Build Status develop]: https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time.svg?branch=develop
[Coverage Status develop]: https://coveralls.io/repos/github/Enteee/pdml2flow-frame-inter-arrival-time/badge.svg?branch=develop
