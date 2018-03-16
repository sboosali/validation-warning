{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

{-# LANGUAGE PackageImports #-}
-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedLists #-}

import "tasty" Test.Tasty

import Validation.Warning.Properties
 
----------------------------------------

main :: IO ()
main = defaultMain $ properties

----------------------------------------
