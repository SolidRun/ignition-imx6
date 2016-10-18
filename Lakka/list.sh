#!/bin/bash

curl -k http://mirror.lakka.tv/nightly/imx6.arm/ 2>/dev/null | grep "href" | cut -f8 -d'"' | grep ".img.gz$" > /tmp/list.out
