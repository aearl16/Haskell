-- @Author Aaron Earl
-- CS360

{- This week's lab will give you practice writing functions using pattern matching, guards, let expressions and case expressions.

Remember to set your editor to use only spaces and no tabs (preferably). This assignment is really the first one where you may run into problems with whitespace and alignment. Using only spaces should ensure that you don't run afoul of the rules.

    1.) For the following, implement using pattern matching of parameters
        a.) A function that associates the integers 0 through 3 with "Heart", "Diamond", "Spade", and "Club", respectively. For any other integer values it is an error.

        getSuit :: Int -> String

        b.) A function that computes the dot product of two 3D vectors (tuples). Follow the Algebraic Definition.

        dotProduct :: (Double,Double,Double) -> (Double,Double,Double) -> Double
        -- e.g.
        dotProduct (1,2,3.0) (4.0,5,6) == 32.0

        c.) A function that reverses the order of the first three elements in a list. If the list has fewer than 3 items then reverse the first two, or if it only has one element or is empty, leave it as is. If it has more then 3 elements then reverse the first 3 as asked and leave the remainder of the list as it is.

        reverseFirstThree :: [a] -> [a]

    2.) For the following, implement using guards
        a.) Write a function that will tell you how warm or cold it feels like outside given a temperature in Fahrenheit. You can make up the ranges (at least 4) but if you call it with a temperature of (-45.3) it should tell you it is "frostbite central!".

        feelsLike :: Double -> String
        -- e.g.
        feelsLike 45 == "Cool"
        feelsLike (-45.3) == "Frostbite Central!"

        b.) Modify your code for the previous problem to convert from celsius to fahrenheit at the same time you're telling what it feels like. Have the user pass in values in celsius this time and you return the temperature in fahrenheit as well as the classification (same as before but after the conversion remember), together in a tuple. Use a where clause to do the temperature conversion.

        feelsLike2 :: Double -> (Double,String)
        -- e.g.
        feelsLike2 100 == (212.0,"Oven-like")
        feelsLike2 (-1) == (30.2,"Freezing")

    3.) Rewrite your answer to the first question above (getSuit) using an explicit case expression.
    4.) Write a function that uses a let expression and pattern matching of tuples in a list comprehension to calculate the volume of a list of cylinders. You'll take in a list of tuples (where the first value in each tuple is the radius and the second is the height) and return a list of volumes as Double's. Don't use a where clause.

    cylinderToVolume :: [(Double,Double)] -> [Double]
    -- e.g.
    cylinderToVolume [(2,5.3),(4.2,9),(1,1),(100.3,94)] == 
    [66.6017642561036,498.7592496839155,3.141592653589793,2970842.2548145014]

To turn in this assignment for a grade: put all answers in a well commented .hs file organized by the question number. Turn in this file. -}

-- 4.1.a
list1 = [0..3]
list2 = ["Heart", "Diamond", "Spade", "Club"]
getSuit :: Int -> String
getSuit 0 = "Heart"
getSuit 1 = "Diamond"
getSuit 2 = "Spade"
getSuit 3 = "Club"

-- 4.1.b
dotProduct :: (Double,Double,Double) -> (Double,Double,Double) -> Double
dotProduct (x1,y1,z1) (x2,y2,z2) = (x1*x2) + (y1*y2) + (z1*z2)

--4.1.c
reverseFirstThree :: [a] -> [a]
reverseFirstThree x = if length x < 2 then x else if length x <= 3 then reverse x else reverse (take 3 x) ++ (drop 3 x)
{- Actual Output
*Main> reverseFirstThree [1,2,3,4,5,6,7,8]
[3,2,1,4,5,6,7,8]
-}

-- 4.2.a
feelsLike :: Double -> String
feelsLike t
    | t < 0 = "Frostbite Central!"
    | t == 0 = "Jeez Its Cold!"
    | t < 32.0 = "Still Freezing"
    | t < 40 = "Cold But You'll Survive"
    | t < 60 = "Not Bad"
    | t < 70 = "Now We're Talking!"
    | t < 80 = "Getting Warm!"
    | t < 100 = "Hot!"
    | t < 110 = "Too Hot!"
    | t < 120 = "Hot Hot!"
    | otherwise = "You'll Probably Die"

-- 4.2.b
-- Farenheit Helper Method
fahrenheit z = (z * 1.8) + 32 
feelsLike2 :: Double -> (Double,String)
feelsLike2 c
    | c < 0 = (fahrenheit c, "Frostbite Central!")
    | c == 0 = (fahrenheit c, "Jeez Its Cold!")
    | c < 32.0 = (fahrenheit c, "Hot!")
    | c < 40 = (fahrenheit c, "Over 100 Wow!")
    | c < 60 = (fahrenheit c, "140 No Survival!")
    | c < 70 = (fahrenheit c, "158 Hope You Have a Suit!")
    | c < 80 = (fahrenheit c, "You Are Dead!")
    | c < 100 = (fahrenheit c, "You Are Really Dead!")
    | c < 110 = (fahrenheit c, "Dead++!")
    | c < 120 = (fahrenheit c, "You Are Burning!")
    | otherwise = (fahrenheit c, "Instantly Vaporized")

-- 4.3
-- Crossed Out

-- 4.4
-- Note: I couldn't figure out how to write the function that does this with let
-- it does however work if entered manually in ghci
-- enter the list below as let xs = [(2,5.3), (4.2,9) ,(1,1), (100.3,94)]
-- Then call cylinderToVolume xs
{- 
Actual output 
*Main> let xs = [(2,5.3), (4.2,9) ,(1,1), (100.3,94)]
*Main> cylinderToVolume xs
[66.6017642561036,498.7592496839155,3.141592653589793,2970842.2548145014]
-}
-- Volume helper function
volume (r,h)  = pi * (r * r) * h
cylinderToVolume :: [(Double,Double)] -> [Double]
cylinderToVolume cy = [volume (x,y) | (x,y) <- cy]
-- The list of Cylinders
-- [(2,5.3), (4.2,9) ,(1,1), (100.3,94)]