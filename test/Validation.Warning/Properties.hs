{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

{-# LANGUAGE PackageImports #-}
{-# LANGUAGE ScopedTypeVariables #-}
-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedLists #-}

-- import Validation.Warning 

import "tasty"          Test.Tasty
import "tasty-hedgehog" Test.Tasty.Hedgehog

import "hedgehog" Hedgehog

import qualified "bytestring" Data.ByteString.Lazy as B
import           "bytestring" Data.ByteString.Lazy (ByteString)

----------------------------------------

properties :: TestTree
properties = 

  testGroup "list properties (stub)"
    [ testProperty "reverse is involutive" 
        property_reverse_involutive

    , testProperty "sort is idempotent" 
        property_sort_idempotent

    , testProperty "Fermat's last theorem" $
        \x y z n -> (n :: Integer) >= 3 ==>
            x^n + y^n /= (z^n :: Integer)
    ]

property_reverse_involutive :: Property
property_reverse_involutive = \(list :: [Int]) ->
 list == reverse (reverse list)

property_sort_idempotent :: Property
property_sort_idempotent = \(list :: [Int]) ->
 sort list == sort (sort list)

----------------------------------------

{-NOTES

-- | Create a 'Test' from a Hedgehog property
testProperty :: T.TestName -> Property -> T.TestTree
testProperty name prop = T.singleTest name (HP name prop)

-}

----------------------------------------
