import sys
import gdb

# Update module path.
dir_ = '/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/glib-2.0/gdb'
if not dir_ in sys.path:
    sys.path.insert(0, dir_)

from gobject import register
register (gdb.current_objfile ())
