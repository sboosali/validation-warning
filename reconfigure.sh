#!/bin/bash
set -e
########################################

cabal2nix . > "nix/validation-warning.nix"

./provision.sh
########################################
