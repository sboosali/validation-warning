{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

{-# LANGUAGE PackageImports #-}
-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedLists #-}

import Validation.Warning

import "criterion" Criterion.Main

----------------------------------------

main :: IO ()
main = defaultMain [
  bgroup "Validation.Warning"

    [ bench "normal form" $
       nf length [1..1000::Int]

    , bench "weak head normal form" $
       whnf length [1..1000::Int]
    ]

  ]

----------------------------------------

