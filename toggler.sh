#!/bin/bash
#
#
# Toggle KDE Virtual Desktops
#
# System Settings -> Keyboard -> Shortcuts -> Add New -> Command or Script
# Give it a name, add and bind it with a desired shortcut.
#

QDBUS="/usr/bin/qdbus"

if which qdbu &> /dev/null; then

	num_of_VirtualDesktops=`$QDBUS org.kde.KWin /VirtualDesktopManager count`
	current_desktop_id=`$QDBUS org.kde.KWin /KWin currentDesktop`

	if (( $current_desktop_id < $num_of_VirtualDesktops )); then
		$QDBUS org.kde.KWin /KWin nextDesktop	
	else
		$QDBUS org.kde.KWin /KWin setCurrentDesktop 1
	fi

else
	echo "ERROR: qdbus is not in the path or not installed."
fi
