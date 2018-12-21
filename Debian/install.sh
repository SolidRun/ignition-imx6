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

IMG_HOST="https://images.solid-build.xyz"
IMG_DIR="/IMX6/Debian/"
wget -q ${IMG_HOST}${IMG_DIR} -O /tmp/index.html

WC_IMAGE="$(cat /tmp/index.html | grep -oh '<a href="sr-imx6-debian-wheezy-cli-201[0-9][0-9][0-9][0-9][0-9]\.img\.xz"' | cut -f2 -d'"' | sort | tail -1)"
WD_IMAGE="$(cat /tmp/index.html | grep -oh '<a href="sr-imx6-debian-wheezy-xfce-201[0-9][0-9][0-9][0-9][0-9]\.img\.xz"' | cut -f2 -d'"' | sort | tail -1)"

JC_IMAGE="$(cat /tmp/index.html | grep -oh '<a href="sr-imx6-debian-jessie-cli-201[0-9][0-9][0-9][0-9][0-9]\.img\.xz"' | cut -f2 -d'"' | sort | tail -1)"
JD_IMAGE="$(cat /tmp/index.html | grep -oh '<a href="sr-imx6-debian-jessie-mate-201[0-9][0-9][0-9][0-9][0-9]\.img\.xz"' | cut -f2 -d'"' | sort | tail -1)"

SC_IMAGE="$(cat /tmp/index.html | grep -oh '<a href="sr-imx6-debian-stretch-cli-201[0-9][0-9][0-9][0-9][0-9]\.img\.xz"' | cut -f2 -d'"' | sort | tail -1)"

# find selected Distro
if [[ $CHOICE = Wheezy* ]]; then
	printf "Selected Release: %s\n" "Wheezy"
	# find selected flavour
	if [[ $CHOICE = *CLI* ]]; then
		printf "Selected Flavour: %s\n" "CLI"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 ${IMG_HOST}${IMG_DIR}${WC_IMAGE}
		exit $?
	fi
	if [[ $CHOICE = *XFCE* ]]; then
		printf "Selected Flavour: %s\n" "XFCE"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 ${IMG_HOST}${IMG_DIR}${WD_IMAGE}
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
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 ${IMG_HOST}${IMG_DIR}${JC_IMAGE}
		exit $?
	fi
	if [[ $CHOICE = *Mate* ]]; then
		printf "Selected Flavour: %s\n" "Mate"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 ${IMG_HOST}${IMG_DIR}${JD_IMAGE}
		exit $?
	fi

	# unknown flavour
	printf "Selected Flavour: %s\n" "Unknown"
	exit 1
fi

if [[ $CHOICE = Stretch* ]]; then
	printf "Selected Release: %s\n" "Stretch"
	# find selected flavour
	if [[ $CHOICE = *CLI* ]]; then
		printf "Selected Flavour: %s\n" "CLI"
		$SHELL $(dirname $0)/ignition2.sh /dev/mmcblk0 ${IMG_HOST}${IMG_DIR}${SC_IMAGE}
		exit $?
	fi
	# unknown flavour
	printf "Selected Flavour: %s\n" "Unknown"
	exit 1
fi
# unknown release
printf "Selected Release: %s\n" "Unknown"
exit 1
