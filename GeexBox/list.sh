#!/bin/bash

GB_HOST="http://download.geexbox.org"

rm -f /tmp/index.html /tmp/list.out

xbmc="Gotham 13.2"
kodi="Jarvis 16.1"
for GB_TYPE in kodi xbmc; do
  name="$(eval echo \$$GB_TYPE)"
  wget -q ${GB_HOST}/snapshots/geexbox-${GB_TYPE}-imx6-cuboxi/ -O /tmp/index.html
  grep "href.* -" /tmp/index.html | cut -f2 -d'"' | sed -e "s%^%${GB_TYPE}: %" -e "s%/% - ${name}%" | sort -r >> /tmp/list.out
done

rm -f /tmp/index.html

xbmc=""
kodi="Krypton 17.0"
for GB_TYPE in kodi; do
  name="$(eval echo \$$GB_TYPE)"
  wget -q ${GB_HOST}/experiments/geexbox-${GB_TYPE}-imx6-cuboxi/binaries.cuboxi/ -O /tmp/index.html
  grep -o ">.*\.cuboxi\.tar\.xz<" /tmp/index.html | sed -e "s%>geexbox-devel-\([^-]*\).*%next: \1 - ${name}%" >> /tmp/list.out
done
