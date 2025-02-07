from fabric import Application
from fabric.hyprland.widgets import Workspaces
from fabric.widgets.box import Box
from fabric.widgets.datetime import DateTime
from fabric.widgets.label import Label
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.scale import Scale
from fabric.widgets.wayland import WaylandWindow as Window
from fabric.widgets.eventbox import EventBox

from multiprocessing import Process as QueueProcess, Queue

from cava import Cava

class VolumeControlAndCava:

    def poll(self):
        """
        Polls the queue for data and updates the bars
        """
        while True:
            self.poll_once(self._queue)

    def poll_once(self, queue):
        """
        Polls the queue for data and updates the bars
        at a rate of 1 second
        :param queue:
        """
        data = queue.get()
        if data is not None:
            self._bars = data

    def __init__(self, cava_rps=1, **kwargs):
        self._cava_rps = cava_rps
        self._last_time = 0
        self._bars = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        self._bars_string_rep = ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" ]
        self._cava = Cava(bar_number=14)
        self._queue = Queue()
        self._cava_queue_thread = QueueProcess(target=self._cava.run, args=(self._queue,))
        self._cava_poll_thread = QueueProcess(target=self.poll)

    def start(self):
        """
        Start the cava process
        """
        self._cava_queue_thread.start()
        self._cava_poll_thread.start()

    def get_bar_from_volume(self, height):
        """
        Get a bar from `self._bars_string_rep` based on height
        :param height: must be between 0 and 1
        :return:
        """
        print("Height ", height)
        if height == 0:
            return ""

        return self._bars_string_rep[int(height * 7) - 1]

    def get_cava_bars(self)-> [str]:
        """
        Get the bars from the volume
        :return: [str]
        """
        return [self.get_bar_from_volume(h) for h in self._bars]

    def get_cava_label(self) -> Label :
        """
        Get the bars from the volume
        :return: [str]
        """
        return Label("-".join(self.get_cava_bars()))


class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            style_classes=["bar-class"],
            anchor="left top right",
            exclusivity='auto',
            v_align="fill",
            inspector=True,
            **kwargs
        )
        self.volume_cava = VolumeControlAndCava()
        self.volume = 0
        self.left_children = [DateTime()]
        self.right_children = [Box(child=self.volume_cava.get_cava_label())]
        self.volume_cava.start()
        self.center_children = [Workspaces(style_classes=["workspaces"])]

        self.children = CenterBox(start_children=self.left_children,
                                  center_children=self.center_children,
                                  end_children=self.right_children,
                                  orientation='h',
                                  style='padding: 10px;')

if __name__ == "__main__":
    bar = Bar()
    app = Application("bar-example", bar)
    app.set_stylesheet_from_file("/home/Sahil/dotfile/fabric/styles/bar.css")
    app.run()