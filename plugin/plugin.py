# vim: set fenc=utf8 ts=4 sw=4 et :
from pdml2flow.plugin import Plugin2
from argparse import ArgumentParser

from json import dumps

argparser = ArgumentParser('Calculate inter arrival times of frames in a flow or on an interface')

DEFAULT_NO_FLOW = False
argparser.add_argument(
    '--no_flow',
    action = 'store_true',
    dest = 'no_flow',
    default = DEFAULT_NO_FLOW,
    help = 'Calculate inter arrival time to the previous frame on the interface, not in the flow [default: {}]'.format(
        DEFAULT_NO_FLOW
    )
)

PRINT_FRAMES = False
argparser.add_argument(
    '--frames',
    action = 'store_true',
    dest = 'frames',
    default = PRINT_FRAMES,
    help = 'Print the frames alongside the inter arrival time [default: {}]'.format(
        PRINT_FRAMES,
    )
)

def _get_frame_time(x):
    return x['frame']['time_epoch']['raw']

class Plugin(Plugin2):

    @staticmethod
    def help():
        """Return a help string."""
        return argparser.format_help()

    def __init__(self, *args):
        """Called once during startup."""
        self._args = argparser.parse_args(args)
        self._last_frame_time = None

    def flow_end(self, flow):
        """Calculate and print the frame inter-arrival time."""
        if not self._args.no_flow:
            inter_arrival_times = []
            prev_t = None
            for t in _get_frame_time(flow.frames):
                if prev_t:
                    inter_arrival_times.append(
                        t - prev_t
                    )
                prev_t = t
            print(
                dumps({
                    'inter_arrival_times': inter_arrival_times,
                    'frames': flow.frames if self._args.frames else None
                })
            )

    def frame_new(self, frame, flow):
        """Calculate and print the frame inter-arrival time."""
        if self._args.no_flow:
            frame_time_now = _get_frame_time(frame)[0]

            if not self._last_frame_time:
                self._last_frame_time = frame_time_now

            print(
                frame_time_now - self._last_frame_time
            )
            self._last_frame_time = frame_time_now

if __name__ == '__main__':
    print(Plugin.help())
