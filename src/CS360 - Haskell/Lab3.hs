-- @Author Aaron Earl
-- CS360

{- Lab 3

This week's lab covers the chapter on types and type classes and a little more work with list comprehensions (because they're so cool!).

    1.) Write a function that uses list comprehensions to generate a list of lists that works like this:

    makeList 3 == [[1],[1,2],[1,2,3]]
    makeList 5 == [[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]
    makeList (-2) == []

    2.) URL's are not allowed to contain spaces. Write a Haskell function that takes a string, and replaces any space characters with the special code %20. For example:

    sanitize "http://wou.edu/my homepage/I love spaces.html" == "http://wou.edu/my%20homepage/I%20love%20spaces.html"

    You may need the concat function, that concatenates a list of lists into a plain list.
    
    3.) Print out the Haskell Class Hierarchy (it's the one from class). Choose 5 type classes and, in pencil/pen next to the box for the class, write all the functions it defines (called Methods in the Prelude). For example, class Eq defines (==) and (/=) so I would write those in next to the Eq box.
    4.) Choose 5 of the following functions, look up their type signature with :t in ghci. Write it down. Then look at the your type class hierarchy from the previous question and write down a few concrete types that it will work with.
        (*)
        (++)
        min
        length
        take
        null
        head
        sqrt
        (>)
        succ
        div
        intersperse (do :m Data.List first in ghci to load the needed module)

To turn in this assignment for a grade: put all answers in a well commented .hs file organized by the question number. Turn in this file. -}

-- Imports for 3.2
import Data.List
import Data.List.Split

-- 3.1
-- should work but produces a list of ones
outList = []
makeList n = if n <= 0 then [] else if n == 1 then outList ++ [1] else outList ++ [1..n] >> print "Here" >> makeList (n-1)

-- 3.2
-- wasn't sure if it was referring to concat or ++?
url = "http://wou.edu/my homepage/I love spaces.html"
stringVal = splitOn " " "http://wou.edu/my homepage/I love spaces.html"
returnString = intercalate "%20" stringVal


-- 3.3
-- Crossed Out

-- 3.4
{- (*) :t
(++) :t
(min) :t
(length) :t
(take) :t 

Prelude> :t (*)
(*) :: Num a => a -> a -> a

Prelude> :t (++)
(++) :: [a] -> [a] -> [a]

Prelude> :t (min)
(min) :: Ord a => a -> a -> a

Prelude> :t (length)
(length) :: Foldable t => t a -> Int

Prelude> :t (take)
(take) :: Int -> [a] -> [a] -}