{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE SuperclassDefaultInstances #-}

module LibAfter where

class Functor f where
	fmap :: (a -> b) -> f a -> f b

class Functor f => Applicative f where
	pure :: a -> f a
	(<*>) :: f (a -> b) -> f a -> f b

class Applicative m => Monad m where
	return :: a -> m a
	(>>=) :: m a -> (a -> m b) -> m b
	default instance Monad m => Functor m where
		fmap f a = a >>= (\x -> return (f x))

	default instance Monad m => Applicative m where
		pure = return
		f <*> a = a >>= (\x -> f >>= \g -> return (g x))
