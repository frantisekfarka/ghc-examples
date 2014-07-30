{-# LANGUAGE NoImplicitPrelude #-}

import Prelude (print)
import Goldfish
import Num

instance Additive' Number where
	add' a b = primAdd a b

main = do
	print (One `add'` One)
	print (One `add'` Two)
	print (One `add'` Three)
