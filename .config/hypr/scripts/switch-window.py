#!/usr/bin/env python3

import gi
import sys
import os
import json
import re

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

# Define theme paths
wofi_config = os.path.expanduser("~/.config/hypr/wofi_window_switcher/config")
wofi_style = os.path.expanduser("~/.config/hypr/wofi_window_switcher/style.css")
wofi_colors = os.path.expanduser("~/.config/hypr/wofi_window_switcher/colors")


def resolveIconPath(iconName):
    iconTheme = Gtk.IconTheme.get_default()
    iconFile = iconTheme.lookup_icon(iconName.lower(), 32, 0)
    if iconFile:
        return iconFile.get_filename()
    else:
        return ""


def mapWindow(w):
    return "img:%s:text:%s" % (
        resolveIconPath(w["class"]),
        "%s (%s_%s)" % (w["title"], w["address"], w["workspace"]["id"]),
    )


windows = json.loads(os.popen("hyprctl -j clients").read())
filtered_windows = list(filter(lambda w: w["workspace"]["id"] != -1, windows))
mapped_windows = list(map(mapWindow, filtered_windows))

print(mapped_windows)
# hide the first entry, which is always the current window
# mapped_windows.pop(0)

# Use theme paths in the os.popen command
selected_window = os.popen(
    'echo "%s" | wofi -S dmenu --conf "%s" --style "%s" --color "%s"'
    % ("\n".join(mapped_windows), wofi_config, wofi_style, wofi_colors)
).read()

print("selected_window: %s" % (selected_window))

if selected_window:
    match = re.search(r"\((\w+)\)$", selected_window)
    addr = match.group(1).split("_")[0]
    os.system("hyprctl dispatch focuswindow address:%s" % (addr))
else:
    print("no selected_window")
