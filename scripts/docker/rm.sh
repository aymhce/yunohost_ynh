#!/bin/bash

docker rm -f $app >/dev/null 2>&1
echo $?
