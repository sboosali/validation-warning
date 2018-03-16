#!/bin/sh
set -e
########################################
./configure.sh
./build.sh

./test.sh

./bench.sh    || true
./haddock.sh  || true
########################################
