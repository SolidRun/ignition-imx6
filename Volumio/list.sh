#!/bin/bash

wget -q https://volumio.org/forum/volumio-for-cuboxi-t9423.html -O - | sed -e 's@<br />@\\\n@g' | grep -oh '<a href=".*\.img\.zip"' | cut -f2 -d'"' > /tmp/list.out
