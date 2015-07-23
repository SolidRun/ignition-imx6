#!/bin/bash

GB_HOST="http://download.geexbox.org/snapshots"

rm -rf /tmp/index.html /tmp/list.out
for GB_TYPE in kodi xbmc; do
  wget -q ${GB_HOST}/geexbox-${GB_TYPE}-imx6-cuboxi/ -O /tmp/index.html
  grep "href.* -" /tmp/index.html | cut -f2 -d'"' | sed -e "s%^%${GB_TYPE}: %" -e "s%/%%" | sort -r >> /tmp/list.out
done
