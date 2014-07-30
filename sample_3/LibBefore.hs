{-# LANGUAGE NoImplicitPrelude #-}

module LibBefore where

class Functor f where
	fmap :: (a -> b) -> f a -> f b

class Functor f => Applicative f where
	pure :: a -> f a
	(<*>) :: f (a -> b) -> f a -> f b


class Monad m where
	return :: a -> m a
	(>>=) :: m a -> (a -> m b) -> m b
