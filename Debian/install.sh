#!/bin/bash
# 
# Copyright (c) 2015 Josua Mayer
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

# find selected Distro
if [[ $CHOICE = Wheezy* ]]; then
	printf "Selected Release: %s\n" "Wheezy"
	# find selected flavour
	if [[ $CHOICE = *CLI* ]]; then
		printf "Selected Flavour: %s\n" "CLI"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 https://images.solid-build.xyz/IMX6/Debian/sr-imx6-debian-wheezy-cli-latest.img.xz
		exit $?
	fi
	if [[ $CHOICE = *XFCE* ]]; then
		printf "Selected Flavour: %s\n" "XFCE"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 https://images.solid-build.xyz/IMX6/Debian/sr-imx6-debian-wheezy-xfce-latest.img.xz
		exit $?
	fi

	# unknown flavour
	printf "Selected Flavour: %s\n" "Unknown"
	exit 1
fi
if [[ $CHOICE = Jessie* ]]; then
	printf "Selected Release: %s\n" "Jessie"
	# find selected flavour
	if [[ $CHOICE = *CLI* ]]; then
		printf "Selected Flavour: %s\n" "CLI"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 https://images.solid-build.xyz/IMX6/Debian/sr-imx6-debian-jessie-cli-latest.img.xz
		exit $?
	fi

	if [[ $CHOICE = *Mate* ]]; then
		printf "Selected Flavour: %s\n" "XFCE"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 https://images.solid-build.xyz/IMX6/Debian/sr-imx6-debian-jessie-mate-latest.img.xz
		exit $?
	fi

	# unknown flavour
	printf "Selected Flavour: %s\n" "Unknown"
	exit 1
fi

# unknown release
echo "Selected Release: %s\n" "Unknown"
exit 1
