{-# LANGUAGE SuperclassDefaultInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverlappingInstances #-}

import System.IO (print)
import Prelude (Show, show, (++), (.))

class Monoid a where
	mempty :: a
	mappend :: a -> a -> a

class Functor f where
	fmap :: (a -> b) -> f a -> f b

class Functor f => Applicative f where
	pure :: a -> f a
	(<*>) :: f (a -> b) -> f a -> f b

class Foldable t where
	foldMap :: Monoid m => (a -> m) -> t a -> m

class (Functor t) => Traversable t where
	traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
	default instance Traversable t => Functor t where
		fmap f = getId . traverse (Id . f)

data Id a = Id { getId :: a }	
	deriving (Show)

instance Functor Id where
	fmap f (Id x) = Id (f x)
instance Applicative Id where
	pure = Id
	Id f <*> Id x = Id (f x)

fmapDefault :: Traversable t => (a -> b) -> t a -> t b
fmapDefault f = getId . traverse (Id . f)

data Maybe a = Nothing | Just a
	deriving (Show)

instance Traversable Maybe where
	traverse _ Nothing = pure Nothing
	traverse f (Just x) = fmap Just (f x)

---------------------------


main = print tst
	where
		tst = show trav
		trav = traverse (fnc (Id " traversed")) (Just "string ")
		fnc (Id x) y = Id (y ++ x)
