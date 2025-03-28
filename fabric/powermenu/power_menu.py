from fabric import Application
from fabric.widgets.widget import Widget
from fabric.widgets.wayland import WaylandWindow as Window

class PowerMenu(Window):
    def __init__(self, **kwargs):
        super().__init__(
            style_classes = ['power-menu'],
            **kwargs)

def powermenu_run():
    powermenu = PowerMenu()
    app = Application("power-menu", powermenu)
    app.set_stylesheet_from_file("/home/Sahil/dotfile/fabric/styles/powermenu.css")
    app.run()