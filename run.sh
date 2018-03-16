#!/bin/sh
set -e
########################################
cabal build
cabal run example-validation-warning
########################################
