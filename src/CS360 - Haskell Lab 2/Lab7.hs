-- @Author: Aaron Earl
-- CS360

{-
Please write your answers to questions 2 through 5 within a module called Lab7 in a file called Lab7.hs, where you export the functions requested. Make sure you can import your module and use your functions from the GHCI prompt.

Like this:

module Lab7
(
--comma separated list of exported function names here
) where

-- Imports and function definitions follow..

    1.) Trace out the execution of each expression, as was done in class, and show how they are different.

    foldl (*) 6 [5,3,8]
    foldr (*) 6 [5,3,8]

    2.) Write your own version of length

    length :: [a] -> Int

    using a fold. Export this function from your module.

    3.) Write two functions, one that uses a left fold and one that uses a right fold, to imitate the behavior of this map

    map intToDigit [5,2,8,3,4] == "52834"

    Call your functions

    convertIntToStringLeft :: [Int] -> [Char]
    convertIntToStringRight :: [Int] -> [Char]

    Export these functions. To do the conversion use

    intToDigit :: Int -> Char

    from Data.Char

    4.) Rewrite two of the following expressions with as few parentheses as possible using the function application operator, $, and/or function composition.

    length (filter (<20) [1..100])
    take 10 (cycle (filter (>5) (map (*2) [1..10])))
    sum (map length (zipWith (flip (++)) ["love you", "love me"] ["i ", "you "]))
    sum (map (\x -> sin (sqrt (abs x))) [1..100])  -- write this one without the lambda function

    5.) OPTIONAL: Explain this mystery function:

    mystery n x = scanr (\y acc -> (acc + y/acc)/2) 1 (replicate n x)
    -- try running these
    -- mystery 10 2
    -- mystery 10 5
    -- mystery 10 36
-}
import Data.Char

-- 7.1
-- Not traced out in class

-- 7.2
length' :: [a] -> Int
length' = foldr (\_ n -> 1 + n) 0
-- Output
{-
*Main> length' [1,2,3]
3
-}

-- 7.3
--convertIntToStringLeft :: [Int] -> [Char]
convertIntToStringRight :: [Int] -> [Char]

convertIntToStringLeft xs = foldl (\acc x -> acc ++ [intToDigit x]) [] xs
convertIntToStringRight xs = foldr (\x acc -> intToDigit x : acc) [] xs    

--Output
{-
*Main> convertIntToStringRight [1,2,3]
"123"
*Main> convertIntToStringLeft [1,2,3]
"123"
-}

-- Fucntions that I took ideas from
-- map' f xs = foldr (\x acc -> f x : acc) [] xs
-- map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- 7.4
--re-write two functions to use less parenthesis using the $ operator
--length (filter (<20) [1..100])
len = length $ filter (<20) [1..100]
--take 10 (cycle (filter (>5) (map (*2) [1..10])))
func = take 10 $ cycle $ filter (>5) $ map (*2) [1..10]

-- Outputs
{-
*Main> length (filter (<20) [1..100])
19
*Main> len
19
*Main> take 10 (cycle (filter (>5) (map (*2) [1..10])))
[6,8,10,12,14,16,18,20,6,8]
*Main> func
[6,8,10,12,14,16,18,20,6,8]
-}


-- 7.5
-- Optional

