-- @Author: Aaron Earl
-- CS360

{- 
Use recursion as the primary method of solving these problems. Beyond that it is your choice whether you want to use let expressions, where clauses, guards, case expressions, if-then-else expressions, ...

    1.) Implement the greatest common divisor algorithm as

    gcdMine :: Integral a => a -> a -> a

    by following the definition here. Check that your answer matches the built-in algorithm with this function:

    gcdCheck x y = (myAnswer, correctAnswer, comment)
      where 
        myAnswer      = gcdMine x y
        correctAnswer = gcd x y
        comment       = if myAnswer == correctAnswer then "Matches" else "Does not Match"
    -- e.g. 
    gcdCheck 111 259 == (37,37,"Matches")
    gcdCheck 2945 123042 == (1,1,"Matches"))
    gcdCheck (2*5*7) (7*23) == (7,7,"Matches")

    2.) Write a function to compute Fibonacci numbers. Follow the description given at the beginning of the chapter.

    fibonacci :: Int -> Int

    When finished check that you get this:

    [fibonacci n | n <- [0..20]] == [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765]

    3.) Write a function that counts how many items are found in a list that match the one given:

    count :: (Eq a, Num b) => a -> [a] -> b

    You could use it like this:

    count 7 [1,7,6,2,7,7,9] == 3
    count 'w' "western oregon wolves" == 2

    4.) Write a function that counts how many even numbers are in a list. Once you get it with recursion, write it a second time using a list comprehension. Which one do you like better? Make sure to write an explicit type signature for your functions.

    5.) Rewrite your answer for Lab 3 question 2 (sanitize) using recursion. You can't use a list comprehension and you can't use the concat function. 
    -}

-- 5.1
gcdMine :: (Integral a)=> a -> a -> a
gcdMine x y = if y == 0 then x else gcdMine y (x `rem` y)

gcdCheck x y = (myAnswer, correctAnswer, comment)
  where 
    myAnswer      = gcdMine x y
    correctAnswer = gcd x y
    comment       = if myAnswer == correctAnswer then "Matches" else "Does not Match"
-- e.g. 
--gcdCheck 111 259 == (37,37,"Matches")
--gcdCheck 2945 123042 == (1,1,"Matches")
--gcdCheck (2*5*7) (7*23) == (7,7,"Matches")

--Output from Checks 
{-
*Main> gcdCheck 111 259 == (37,37,"Matches")
True
*Main> gcdCheck 2945 123042 == (1,1,"Matches")
True
*Main> gcdCheck (2*5*7) (7*23) == (7,7,"Matches")
True
*Main>
-}

-- 5.2
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

--Output of check
{- *Main> [fibonacci n | n <- [0..20]] == [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765]
True-}

-- 5.3
count :: (Eq a, Num b) => a -> [a] -> b; 
count y (x:xs)  
    | xs == [] = 0 
    | x == y    = 1 + count y xs 
    | otherwise = count y xs

-- Ouput of check
{-
*Main> count 7 [1,7,6,2,7,7,9] == 3
True
*Main> count 'w' "western oregon wolves" == 2
True
-}

-- 5.4
-- Crossed Out

-- 5.5
url = "http://wou.edu/my homepage/I love spaces.html"
sanitize :: String -> String
--use pattern matching
{-}anitize [] = []
sanitize (x:xs) = go x    xs
          where   go ' '  []     = "%20" 
                  go y    []     = [y] 
                  go ' '  (x:xs) = '%':'2':'0': go x xs  
                  go y    (x:xs) = y: go x xs-}
sanitize [] = []
sanitize (x:xs) =
    if x == ' '
    then '%':'2':'0' : sanitize xs
    else x : sanitize xs
{- Output of test
*Main> sanitize url
"http://wou.edu/my%20homepage/I%20love%20spaces.html"
*Main>
-}