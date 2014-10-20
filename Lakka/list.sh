#!/bin/bash

rm -rf /tmp/index.html
wget http://sources.lakka.tv/nightly/ -O /tmp/index.html
grep Cubox /tmp/index.html | cut -f8 -d'"' | grep tar > /tmp/list.out
