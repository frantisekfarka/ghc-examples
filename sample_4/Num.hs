{-# LANGUAGE SuperclassDefaultInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
module Num where

{-
 - Numeric classes
 -}


class Additive a where
	add :: a -> a -> a

class Additive' a where
	add' :: a -> a -> a

class Multiplicative m where
	mul :: m -> m -> m

class (Additive n, Multiplicative n) => Num n where
	(+), (*) :: n -> n -> n
	default instance Num a => Additive a where
		add a b = a + b
	default instance Num a => Multiplicative a where
		mul a b = a * b
