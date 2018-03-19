{-
    CS 360 lab 4
    Emmet syntax HTML generator.
    Starting code
    @Author: Aaron Earl
-}

module Main
(
main
) where

import System.IO (hFlush, stdout)
import Data.List.Split

{-
    First processing function.  This function takes the entire
    line of text from the user.

    This one obviously doesn't do what is required for the lab,
    but is just here to show you the basic I/O
-}

process :: String -> String
-- Original Code
{-
process text = if head text == 'p'
    then "<p></p>"
    else "Only works for 'p'"
-}
-- Helper Methods
getClass :: [String] -> String
getID :: [String] -> String
getChild :: [String] -> String
--repVal :: [String] -> String
getClass t = ("<" ++ t!!0 ++ " class=" ++ "\"" ++ t!!1 ++ "\"" ++ ">" ++ "</" ++ t!!0 ++ ">")
getID t = ("<" ++ t!!0 ++ " id=" ++ "\"" ++ t!!1 ++ "\"" ++ ">" ++ "</" ++ t!!0 ++ ">")
getChild t = ("<" ++ t!!0 ++ ">" ++ "<" ++ t!!1 ++ ">" ++ "</" ++ t!!1 ++ ">" ++ "</" ++ t!!0 ++ ">")
--repVal t = replicate ("<" ++ t!!0 ++ ">" ++ "</" ++ t!!0 ++ ">") (read (t!!1):: Int)

process text
    | text == "p"  ="<p></p>"
    | text == "div"     ="<div></div>" -- Part 2 ==> Add a valid element
    |'.' `elem` text    =getClass (splitOn "." text) -- Part 3 ==> Add a class
    | '#' `elem` text   =getID (splitOn "#" text) -- Part 4 ==> Add an Id
    | '>' `elem` text   =getChild (splitOn ">" text) -- Part 5 ==> Add Children
    {-| '*' `elem` text   =repVal (splitOn ">" text)-}
    | otherwise         ="Invalid Entry"

{- Output
*Main> main
Type Emmet abbreviations and we'll generate HTML for you
  -- to quit, hit return on an empty line

emmet: p
<p></p>

emmet: div
<div></div>

emmet: div.centered
<div class="centered"></div>

emmet: p.myParagraph
<p class="myParagraph"></p>

emmet: div>p
<div><p></p></div>

emmet:
Exiting ...
*Main>
-}

{-
    The main entry point function.  Interactively expand Emmet syntax
    abbreviations and generate HTML skeleton code.  Prints HTML to standard
    output.

    Enter an empty line to quit.
-}
main :: IO ()
main = do
  putStrLn "Type Emmet abbreviations and we'll generate HTML for you"
  putStrLn "  -- to quit, hit return on an empty line"
  -- invoke a recursive main to continue to prompt the user until they wish to quit
  mainR

-- Main interactive function
mainR :: IO ()
mainR = do
  putStr "\nemmet: "
  hFlush stdout   -- line buffering prevents the prompt from printing without the newline, so this sends it
  oneLine <- getLine
  if null oneLine
    then do
      putStrLn "Exiting ..."
      return ()
    else do
      putStrLn $ process oneLine
      mainR
