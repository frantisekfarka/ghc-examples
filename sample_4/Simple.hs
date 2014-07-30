{-# LANGUAGE NoImplicitPrelude #-}

import Prelude (print)
import Goldfish
import Num

instance Num Number where
	a + b = primAdd a b
	a * b = primMul a b



main = do
	print (One + One)
	print (One + Two)
	print (One + Three)
	print (Two * Two)
