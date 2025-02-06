import fabric
from fabric import Application
from fabric.hyprland.widgets import Workspaces
from fabric.widgets.datetime import DateTime
from fabric.widgets.box import Box
from fabric.widgets.label import Label
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.wayland import WaylandWindow as Window

class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            layer="top",
            anchor="left top right",
            exclusivity="auto",
            **kwargs
        )

        self.left_children = [DateTime()]
        self.right_children = [Label("Hello world")]
        self.center_children = [Workspaces()]

        self.children = CenterBox(start_children=self.left_children,
                                  center_children=self.center_children,
                                  end_children=self.right_children)

if __name__ == "__main__":
    bar = Bar()
    app = Application("Bar", bar)
    app.set_stylesheet_from_file("/home/Sahil/dotfile/fabric/styles/build/bar.css")
    app.run()