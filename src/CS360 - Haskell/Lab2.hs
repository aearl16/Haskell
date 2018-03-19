-- @Author Aaron Earl
-- CS360

{- Lab 2

This week's lab picks up with where we left off in Chapter 2, with lists. Remember, the answer to these questions is the Haskell code needed to answer them.

    1.) While you are doing the reading for this week keep a record of your session like you did last week. Turn this in with the rest of the questions below.
    (Please do the "active reading" but no need to copy it and turn it in -- I'll trust you on this one)
    2.) What is the product of all the odd numbers one to one hundred?
    3.) Use list operation functions like head, tail, last, etc. to find the greatest number in the following list, that is not the first or last number. i.e. if the first and last numbers don't count, then what is the largest number in the "middle" of the list?

    [99,23,4,2,67,82,49,-40]

    4.) Using the list construction operator, :, and the empty list, [], write an expression to construct a list like this: [6,19,41,-3], i.e. don't just write the list, construct it.
    5.) Write Haskell expressions that use list comprehensions to solve the following problems.
        a.) What are the first 27 even numbers? Use the even function and be Lazy!
        b.) Provide a list of all odd numbers less than 200 that are divisible by 3 and 7.
        c.) How many odd numbers are there between 100 and 200 and that are divisible by 9?
        d.) A chess board is an 8 x 8 grid. If we number each row and column with numbers 1 through 8, then we can index any location on the board as a tuple of numbers. For example, row 2 column 8 would be (2,8). Write an expression that creates a list of all possible chessboard indices (a list of tuples)
        e.) Count how many negative numbers there are in a list of numbers.
    6.) Use zip, Texas ranges and concatenation, to create a list of Hexadecimal mappings like this:

    [(0,'0'),(1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),
    	(10,'A'),(11,'B'),(12,'C'),(13,'D'),(14,'E'),(15,'F')]

To turn in this assignment for a grade: put all answers in a well commented .hs file organized by the question number. Turn in this file. -}

-- 2.1 Crossed out

-- 2.2
fact = product [1,3..100]
-- this also works
fact2 = product (filter odd [x | x <- [1..100]])

-- 2.3
list = [99,23,4,2,67,82,49,-40]
greatest = (tail (tail (tail (tail (tail (init (init (list))))))))

-- 2.4
mylist = 6:19:41:(-3):[]

-- 2.5.a
listEven = [0..27]
evens = filter even listEven

-- 2.5.b
listOddDiv = [x | x <- [1,3..200], x `mod` 3 == 0, x `mod` 7 == 0]

-- 2.5.c
listOddNine = length [x | x <- [101,103..200], x `mod` 9 == 0]
-- another way to do it
listOddNine2 = length (filter odd [xs | xs <- [ x| x <- [100..200], x `mod` 9 == 0]])

-- 2.5.d
-- Crossed Out

-- 2.5.e
-- Note used the list above
countNegative = length [x | x <- list, x < 0]

-- 2.6
hexMap = zip [0..15] (['0'..'9'] ++ ['A'..'F'])