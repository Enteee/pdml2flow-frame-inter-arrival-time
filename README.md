# pdml2flow-frame-inter-arrival-time [![PyPI version](https://badge.fury.io/py/pdml2flow-frame-inter-arrival-time.svg)](https://badge.fury.io/py/pdml2flow-frame-inter-arrival-time) 
_[pdml2flow] plugin to calculate frame inter arrival times_

| Branch  | Build  | Coverage |
| ------- | ------ | -------- |
| master  | [![Build Status master]](https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time) | [![Coverage Status master]](https://coveralls.io/github/Enteee/pdml2flow-frame-inter-arrival-time?branch=master) |
| develop  | [![Build Status develop]](https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time) | [![Coverage Status develop]](https://coveralls.io/github/Enteee/pdml2flow-frame-inter-arrival-time?branch=develop) |

## Prerequisites

* [python]:
  - 3.4
  - 3.5
  - 3.5-dev
  - 3.6
  - 3.6-dev
  - 3.7-dev
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

* Print inter arrival times form `dump.capture`:
```sh
$ tshark -r dump.capture -Tpdml | pdml2flow +frame-inter-arrival-time
{"inter_arrival_times": [7.152557373046875e-07, 0.0, 0.1733696460723877], "frames": null}
{"inter_arrival_times": [3.7670135498046875e-05, 2.3126602172851562e-05], "frames": null}
{"inter_arrival_times": [0.16418147087097168, 0.0007672309875488281, 0.16009950637817383, 0.00016069412231445312, 0.0007240772247314453, 0.15914177894592285, 3.814697265625e-05, 5.245208740234375e-06], "frames": null}
{"inter_arrival_times": [0.1608715057373047, 0.15995335578918457, 2.384185791015625e-07, 2.384185791015625e-07, 2.384185791015625e-07, 0.15888381004333496], "frames": null}
{"inter_arrival_times": [0.16829872131347656, 0.0007762908935546875, 0.14913678169250488, 0.000125885009765625, 0.000736236572265625, 10.19379997253418], "frames": null}
```

* Print inter arrival times with a different flow aggregation. For example by interface, if you captured from multiple interfaces:
```sh
$ tshark -r dump.capture -Tpdml | pdml2flow -f frame.interface_name +frame-inter-arrival-time
{"inter_arrival_times": [7.152557373046875e-07, 0.0, 0.00018739700317382812, 3.7670135498046875e-05, 2.3126602172851562e-05, 0.008971691131591797, 0.16414976119995117, 4.76837158203125e-07, 3.123283386230469e-05, 0.0007672309875488281, 0.16007304191589355, 2.6464462280273438e-05, 0.00016069412231445312, 0.0007240772247314453, 0.1590421199798584, 2.384185791015625e-07, 2.384185791015625e-07, 2.384185791015625e-07, 9.894371032714844e-05, 3.814697265625e-05, 5.245208740234375e-06, 0.0006232261657714844, 0.15811824798583984, 0.010167837142944336, 1.2636184692382812e-05, 0.0007762908935546875, 0.14911913871765137, 1.7642974853515625e-05, 0.000125885009765625, 0.000736236572265625, 0.16014313697814941, 0.035120248794555664, 0.2039034366607666, 1.907348632, ... ] }
```

* Print arrival times without flow aggregation:
```sh
$ tshark -r dump.capture -Tpdml |  pdml2flow +frame-inter-arrival-time --no_flow
0.0
7.152557373046875e-07
0.0
0.00018739700317382812
3.7670135498046875e-05
2.3126602172851562e-05
0.008971691131591797
0.16414976119995117
4.76837158203125e-07
3.123283386230469e-05
```

[pdml2flow]: https://github.com/Enteee/pdml2flow
[python]: https://www.python.org/
[wireshark]: https://www.wireshark.org/

[Build Status master]: https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time.svg?branch=master
[Coverage Status master]: https://coveralls.io/repos/github/Enteee/pdml2flow-frame-inter-arrival-time/badge.svg?branch=master
[Build Status develop]: https://travis-ci.org/Enteee/pdml2flow-frame-inter-arrival-time.svg?branch=develop
[Coverage Status develop]: https://coveralls.io/repos/github/Enteee/pdml2flow-frame-inter-arrival-time/badge.svg?branch=develop
