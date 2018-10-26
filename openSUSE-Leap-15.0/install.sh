#!/bin/bash
# 
# Copyright (c) 2015 Josua Mayer
# Copyright (c) 2018 Alessio Adamo
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# 


# find selected flavour
if [[ $CHOICE = *JeOS* ]]; then
	printf "Selected Flavour: %s\n" "JeOS"
	$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-JeOS-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
	exit $?
fi
if [[ $CHOICE = *X11* ]]; then
	printf "Selected Flavour: %s\n" "X11"
	$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-X11-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
	exit $?
fi
if [[ $CHOICE = *XFCE* ]]; then
	printf "Selected Flavour: %s\n" "XFCE"
	$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-XFCE-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
	exit $?
fi
if [[ $CHOICE = *E20* ]]; then
	printf "Selected Flavour: %s\n" "E20"
	$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-E20-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
	exit $?
fi
if [[ $CHOICE = *LXQt* ]]; then
	printf "Selected Flavour: %s\n" "LXQt"
	$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-LXQT-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
	exit $?
fi
if [[ $CHOICE = *KDE* ]]; then
	printf "Selected Flavour: %s\n" "KDE"
	$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk http://download.opensuse.org/ports/armv7hl/distribution/leap/15.0/appliances/openSUSE-Leap15.0-ARM-KDE-cuboxi.armv7l-2018.07.02-Buildlp150.1.1.raw.xz
	exit $?
fi
# unknown flavour
printf "Selected Flavour: %s\n" "Unknown"
exit 1
