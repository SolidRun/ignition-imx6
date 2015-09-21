#!/bin/bash -e
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

usage() {
	echo "$0 <disk> <URL>"
	exit 1
}

if [ "x$#" != "x2" ]; then
	usage
fi
disk="$1"
url="$2"

if [ "x$UID" != "x0" ]; then
	echo "Error: This script requires root privileges!"
	exit 1
fi

# unexpected exit hook
cleanup() {
	echo "An unknown error occured!"
	exit 1
}
trap cleanup 0

download() {
	url="$1"

	curl -k "$url" --progress
	return $?
}

decompress() {
	url="$1"

	# detect compression, if any
	if [[ $url = *.xz ]]; then
		# unxz
		xz -d
		return $?
	fi
	if [[ $url = *.gz ]]; then
		gzip -d
		return $?
	fi

	# no compression detected, just forward the data without modification
	cat
	return $?
}

write() {
	disk="$1"

	dd of="$disk" bs=4M conv=fsync
	return $?
}

# configure busybox so pipes fail if either element fails
set -o pipefail

# download, decompress and write
download "$url" | decompress "$url" | write "$disk"
ret=$?
if [ $ret != 0 ]; then
	exit $ret
fi

# clear trap
trap - 0
