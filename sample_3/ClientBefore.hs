{-# LANGUAGE NoImplicitPrelude #-}

import LibBefore
import Prelude(putStrLn, (++), Show, show, String)

data MyIdentity a = Id a
	deriving Show

instance Monad MyIdentity where
	return = Id
	(Id a) >>= f = f a


main = do
	putStrLn (show m)
	where
		f :: String -> MyIdentity String
		f = \x -> return (x ++ " world!")
		m = (return "Hello") >>= f
