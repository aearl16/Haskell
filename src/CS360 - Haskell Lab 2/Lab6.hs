-- @Author: Aaron Earl
-- CS360

{- 
1.) Use one or more of the following functions to solve 5 of the following problems. You can use other functions too of course, but these questions are to give you practice with these specifically so make sure one of them is in there somewhere. Not all must be used. (A good place to look these up is Hoogle)

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
takeWhile :: (a -> Bool) -> [a] -> [a]
dropWhile :: (a -> Bool) -> [a] -> [a]
flip :: (a -> b -> c) -> b -> a -> c
map :: (a -> b) -> [a] -> [b]
filter :: (a -> Bool) -> [a] -> [a]
any :: (a -> Bool) -> [a] -> Bool
all :: (a -> Bool) -> [a] -> Bool

Write an expression for each that uses higher order functions and not list comprehensions. For some you may need an additional function. Either write it separately or use a lambda expression.
    Multiply every element of a list by 10
    Create an infinite list of the powers of 2
    Increment every element in a list. Write it again so that it can increment things that are not numbers, i.e. turn "Hello" into "Ifmmp"
    Subtract 10 from every element in a list.
    Remove all spaces from a string
    Tell you True or False whether or not a list contains the number 55.
    Tell you True or False whether or not a list contains a value that is divisible by 42
    Remove all elements at the beginning of a list of booleans that are not True
    Use zipWith to take a list like this [5,3,8,2,3,6,3] to this [100000,1000,100000000,100,1000,1000000,1000] i.e. it raises 10 to the power of the element in the list and places it in that list. HINT: You shouldn't have to ask how long the list is (use an infinite list!).
    Remove all spaces from the end of a string (often called stripping a string).
    Tell you True or False if a list contains nothing but even numbers.
    Put the word "not" on the front of all strings in a list. e.g. ["Funny","cold","slow"] ==> ["not Funny","not cold","not slow"]
    Reverse all strings contained in a list. e.g. ["This","is","a","sentence"] ==> ["sihT","si","a","ecnetnes"]

2.) Choose two of these functions and rewrite as lambda functions

    plus x y = x + y

    (*4)

    A function that gives you the second element in a list.
    A function that takes the square root of a number and then rounds it.

3.) Write Haskell functions and/or expressions to answer this question: Does a sentence contain any words that are palindromes? The words function is useful here:

words "This is a sentence written in the usual way."
     == ["This","is","a","sentence","written","in","the","usual","way."]

4.) Use a Lambda expression and map to take a list of tuples and produce a list of values. The list contains the lengths of two sides of right triangles, a and b. You want to produce a list that contains the lengths of all three sides, where the third side, c, is found with the Pythagorean theorem.

[(3,4),(5,16),(9.4,2)]
     == [(3.0,4.0,5.0),(5.0,16.0,16.76305461424021),(9.4,2.0,9.610411021387172)]

If it helps, write it first by defining a function separately and once it is working, rewrite it as a lambda expression.
-}

-- 6.1 ==> Pick 5
-- a.) Multiply every element of a list by 10
{- *Main> map (* 10) [1,2,3]
[10,20,30] -}

-- b.) Create an infinite list of the powers of 2
{-
*Main> map (^2) [1..]
[1,4,9,16,25,36,49,64,81,100,121,144,169,196,225,256,289,324,361,400,441,484,529,576,625,676,729,784,841,
900,961,1024,1089,1156,1225,1296,1369,1444,1521,1600,1681,1764,1849,1936,2025,2116,2209,2304,2401,2500,2601,
2704,2809,2916,3025,3136,3249,3364,3481,3600,3721,3844,3969,4096,4225,4356,4489,4624,4761,4900,5041,5184,5329,
5476,5625,5776,5929,6084,6241,6400,6561,6724,6889,7056,7225,7396,7569,7744,7921,8100,8281,8464,8649,8836,9025,
9216,9409,9604,9801,10000,10201,10404,10609,10816,11025,11236,11449,11664,11881,12100,12321,12544,12769,12996,
13225,13456,13689,13924,14161,14400,14641,14884,15129,15376,15625,15876,16129,16384,16641,16900,17161,17424,17689,
17956,18225,18496,18769,19044,19321,19600,19881,20164,20449,20736,21025,21316,21609,21904,22201,22500,22801,23104,
23409,23716,24025,24336,24649,24964,25281,25600,25921,26244,26569,26896,27225,27556,27889,28224,28561,28900,29241,
29584,29929,30276,30625,30976,31329,31684,32041,32400,32761,33124,33489,33856,34225,34596,34969,35344,35721,36100,
36481,36864,37249,37636,38025,38416,38809,39204,39601,40000,40401,40804,41209,41616,42025,42436,42849,43264,43681,
44100,44521,44944,45369,45796,46225,46656,47089,47524,47961,48400,48841,49284,49729,50176,50625,51076,51529,51984,
52441,52900,53361,53824,54289,54756,55225,55696,56169,56644,57121,57600,58081,58564,59049,59536,60025,60516,61009,
61504,62001,62500,63001,63504,64009,64516,65025,65536,66049,66564,67081,67600,68121,68644,69169,69696,70225,70756,
71289,71824,72361,72900,73441,73984,74529,75076,75625,76176,76729,77284,77841,78400,78961,79524,80089,80656,81225,
81796,82369,82944,83521,84100,84681,85264,85849,86436,87025,87616,88209,88804,89401,90000,90601,91204,91809,92416,
93025,93636,94249,94864,95481,96100,96721,97344,97969,98596,99225,99856,100489,101124,101761,102400,103041,103684,
104329,104976,105625,106276,106929,107584,108241,108900,109561,110224,110889,111556,112225,112896,113569,114244,
114921,1156... Keeps going....
-}

-- c.) Increment every element in a list. Write it again so that it can increment things that are not numbers, i.e. turn "Hello" into "Ifmmp"
{-
*Main> map (succ) [1,2,3]
[2,3,4]
*Main> map (succ) "dude"
"evef"
*Main> map (succ) "Hello"
"Ifmmp"
-}

-- d.) Subtract 10 from every element in a list.
{-
*Main> map (subtract 10) [3,4,5]
[-7,-6,-5]
-}

-- e.) 
{-
*Main> filter (/=' ') "Hello World"
"HelloWorld"
-}

-- 6.2
-- a.) plus x y = x + y
plus :: (Num a) => a -> a -> a
plus = \x -> \y -> x + y
-- Output
{-
*Main> plus 1 3
4
-}

-- b.) (*4)
multFour :: (Num a) => a -> a
multFour = \x -> x * 4
-- Output
{-
*Main> multFour 5
20
-}

-- 6.3
-- Crossed Out

-- 6.4
list = [(3.0,4.0),(5.0,16.0),(9.4,2.0)]
getSides = map (\(x,y) -> (x, y, sqrt ((x^2) + (y^2))))
-- Ouput
{-
*Main> getSides list
[(3.0,4.0,5.0),(5.0,16.0,16.76305461424021),(9.4,2.0,9.610411021387172)]
-}
