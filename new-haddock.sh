#!/bin/sh
set -e

########################################

cabal new-haddock --haddock-option="--hyperlinked-source"
# not `cabal haddock --hyperlink-source` lol

########################################

ARCHITECTURE="x86_64-linux"
COMPILER="ghc-8.2.2"

PACKAGE="validation-warning"
VERSION="0.0.0"

xdg-open ./dist-newstyle/build/"$ARCHITECTURE/$COMPILER/$PACKAGE-$VERSION"/doc/html/"$PACKAGE"/index.html  >/dev/null 2>&1

########################################
