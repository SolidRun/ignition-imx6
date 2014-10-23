#!/bin/bash

rm -rf /tmp/index.html
wget http://download.geexbox.org/snapshots/geexbox-xbmc-imx6-cuboxi/ -O /tmp/index.html
grep href /tmp/index.html | cut -f2 -d'"' | grep -v "\.\./" > /tmp/list.out
