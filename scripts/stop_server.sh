#!/bin/bash
isExistApp=$(pgrep httpd)
if [[ -n $isExistApp ]]; then
    service httpd stop
    echo "Apache stopped successfully"
else
    echo "Apache was not running"
fi
