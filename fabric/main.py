import sys
from powermenu import PowerMenu
from powermenu.power_menu import powermenu_run


def main(args: [str]):
    if args[1] == "powermenu":
        powermenu_run()


if __name__ == '__main__':
    main(sys.argv)
