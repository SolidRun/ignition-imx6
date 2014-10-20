#!/bin/bash

rm -rf /tmp/index.html
wget http://snapshots.openelec.tv/ -O /tmp/index.html
grep Cubox /tmp/index.html | cut -f2 -d'"' | egrep "img|tar" > /tmp/list.out
