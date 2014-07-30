{-# LANGUAGE NoImplicitPrelude #-}
module Goldfish where

import Prelude(Show)
{-
 - Goldfish arithmetics module
 -}

data Number = Zero | One | Two | Three | Many
	deriving (Show)

primAdd, primMul :: Number -> Number -> Number
primAdd Zero  Zero  = Zero
primAdd Zero  One   = One
primAdd Zero  Two   = Two
primAdd Zero  Three = Three
primAdd One   Zero  = One
primAdd One   One   = Two
primAdd One   Two   = Three
primAdd Two   Zero  = Two
primAdd Two   One   = Three
primAdd Three Zero  = Three
primAdd _     _     = Many

primMul Zero _    = Zero
primMul _    Zero = Zero
primMul One  x    = x
primMul x    One  = x
primMul Two  One  = Two
primMul One  Two  = Two
primMul _    _    = Many
	
