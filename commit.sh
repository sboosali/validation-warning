#!/bin/sh
set -e
########################################
./verify.sh

./dependencies.sh
git add metadata

git commit
########################################
