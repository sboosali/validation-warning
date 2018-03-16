{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
-- {-# OPTIONS_GHC -F -pgmF hspec-discover #-}

{-# LANGUAGE PackageImports #-}
-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedLists #-}

import Validation.Warning.Test

import "tasty" Test.Tasty

----------------------------------------

main :: IO ()
main = defaultMain tests

----------------------------------------
