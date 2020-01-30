#!/usr/bin/env python3
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

icon_name = input("Icon name (case sensitive): ")
icon_theme = Gtk.IconTheme.get_default()
icon = icon_theme.lookup_icon(icon_name, 48, 0)
if icon:
    print(icon.get_filename())
else:
    print("not found")
    
# https://askubuntu.com/questions/52430/how-can-i-find-the-location-of-an-icon-of-a-launcher-in-use
