module Sample1 where

class Super a where 
	foo :: a

class Sub a where
	bar :: a
	default instance Sub a => Super a where
		foo = bar
