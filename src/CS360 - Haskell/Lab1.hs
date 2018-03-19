-- @Author Aaron Earl
-- CS360

{- Lab 1

For this first homework we just need to get going, and that means practicing -- reading and doing. Question one should do that nice and easy.

   1.) Get yourself set up with a Haskell installation. I recommend The Haskell Platform. It's big but nice and easy and comes with everything you need.

   2.) Do the reading for this week: Introduction and Starting Out through "Baby's first functions" (pages xv-?? in paper copy). While you are reading, have a session in GHCI open. For each and every concept you read about, try it out. This means typing in many examples from the book and trying out your own versions. When you are finished with the chapter, copy or print out the text from your entire session and turn that in with any further questions below. Make sure you keep it as simple text and not mangled in a Word doc.

    Just to confirm, yes type it yourself, do not copy and paste! You'll store it better in your brain if you're the one typing it. And when you are trying out your own versions, try to think of other things to try. Be inquisitive. For example the book says that GHCI will yell at you for trying to evaluate 5 * -3. But -3 * 5 works just fine. Why? Not all your examples should work, that's part of learning the syntax. And it's better to learn by failing when you're doing it on your own time and not during a quiz, right?

    For each of the following, write a Haskell expression that answers the question and then include the answer.
    3.) What is the square root of 818281336460929553769504384519009121840452831049?
    4.) What is the ASCII character that comes before uppercase A?
    5.) What is a function that evaluates to True or False, that tells you whether or not three times a number plus one is even? Try it out on a couple numbers.

To turn in this assignment for a grade: put all answers in a well commented .hs file organized by the question number. Turn in this file. -}


-- Lab 1.1, 1.2, 1.3 ==> Get Haskell set up and do demos using GHCI

-- 1.3
number = 818281336460929553769504384519009121840452831049
squareRoot = sqrt number

-- 1.4
asciiChar = 'A'
getPred = pred asciiChar

-- 1.5
{-numberToCheck x = (x * 3) + 1 :: Int
modNum = numberToCheck `mod` 2 :: Int
checkNum = if modNum == 0
           then True
           else False-}
checkNum x = if (x * 3 + 1) `mod` 2 == 0 then True else False