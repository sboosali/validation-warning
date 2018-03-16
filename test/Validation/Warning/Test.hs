{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

{-# LANGUAGE PackageImports #-}
-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedLists #-}

module Validation.Warning.Test where

--import Validation.Warning 

----------------------------------------

import "tasty"       Test.Tasty
import "tasty-hunit" Test.Tasty.HUnit

----------------------------------------

tests :: TestTree
tests = testCase "Example unit test" $ do
  assertion

assertion :: Assertion
assertion = do 

    2 + 2      @?= (4 :: Int)   -- `actual`   on left
    
    (6 :: Int) @=? 3 + 3        -- `expected` on left
    
    assertBool "the list is not empty" $ null []

----------------------------------------

{-NOTES


testCase :: TestName -> Assertion -> TestTree



-- | Asserts that the specified actual value is equal to the expected value
--   (with the expected value on the left-hand side).
(@=?)
  :: (Eq a, Show a, HasCallStack)
  => a -- ^ The expected value
  -> a -- ^ The actual value
  -> Assertion
expected @=? actual = assertEqual "" expected actual

-- | Asserts that the specified actual value is equal to the expected value
--   (with the actual value on the left-hand side).
(@?=)
  :: (Eq a, Show a, HasCallStack)
  => a -- ^ The actual value
  -> a -- ^ The expected value
  -> Assertion
actual @?= expected = assertEqual "" expected actual

-- | An infix and flipped version of 'assertBool'. E.g. instead of
--
-- >assertBool "Non-empty list" (null [1])
--
-- you can write
--
-- >null [1] @? "Non-empty list"
--
-- '@?' is also overloaded to accept @'IO' 'Bool'@ predicates, so instead
-- of
--
-- > do
-- >   e <- doesFileExist "test"
-- >   e @? "File does not exist"
--
-- you can write
--
-- > doesFileExist "test" @? "File does not exist"
(@?) :: (AssertionPredicable t, HasCallStack)
  => t          -- ^ A value of which the asserted condition is predicated
  -> String     -- ^ A message that is displayed if the assertion fails
  -> Assertion
predi @? msg = assertionPredicate predi >>= assertBool msg


-}
----------------------------------------
