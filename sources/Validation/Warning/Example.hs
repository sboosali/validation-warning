{-# OPTIONS_GHC -fno-warn-missing-signatures #-} 
    -- to test inference

-- {-# LANGUAGE  #-}
-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedLists #-}

{-| This module provides an example program. 
Please read the source too <https://hackage.haskell.org/package/validation-warning/docs/src/Validation-Warning-Example.html (direct Hackage link)>. 

Being a @library@ module, it's typechecked with the package, 
and thus should always build.

Only public interfaces are imported (i.e. no @.Internal@s),
and there are minimal other dependencies. 

'main' is executed by the @validation-warning-example@ executable. 

-}
module Validation.Warning.Example where

import Validation.Warning()

import System.Environment

import Prelude

----------------------------------------

{-|

Running:

@
cabal build && cabal run example-validation-warning
@

@
stack build && stack exec -- example-validation-warning
@

-}
main :: IO ()
main = do
 arguments <- getArgs >>= \case
  [s] -> return (s)
  _ -> return ("")
 mainWith arguments

mainWith s = do
 putStrLn s
 putStrLn "(Validation.Warning.Example...)"

----------------------------------------
