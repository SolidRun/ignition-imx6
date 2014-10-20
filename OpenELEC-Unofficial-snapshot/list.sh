#!/bin/bash

rm -rf /tmp/index.html
wget http://solidrun.maltegrosse.de/~ryo/ -O /tmp/index.html
grep Cubox /tmp/index.html | cut -f2 -d'"' | egrep "tar" > /tmp/list.out
