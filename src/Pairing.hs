{-# LANGUAGE OverloadedStrings #-}

module Pairing where

import Control.Applicative
import Data.Attoparsec.ByteString.Char8

pairing :: String
pairing = "hello world"

-- question: what colors are valid?
-- how do we parse user input into a color?
data Color = Red | Orange | Yellow | Green | Blue | Purple
  deriving (Show, Eq)

-- R, O, Y, G, B, P
colorP :: Parser Color
colorP =
  Red <$ string "R"
    <|> Orange <$ string "O"

-- this can use ReadP, or it could just check strings
-- parse :: String -> Maybe Color
-- parse = undefined

-- this might be awkward to check against a guess
-- it would also be awkward (lots of small checks) to check against a list
-- data SecretAnswer = SecretAnswer (Color, Color, Color, Color)
data SecretAnswer = SecretAnswer [Color]

-- this is not exactly the same thing as black/white pegs
-- should we just use black/white pegs?
data GuessResult = GuessResult
  { correctSpotAndColor :: Int,
    correctColor :: Int
  }
  deriving (Show, Eq)

winResult :: GuessResult
winResult = GuessResult {correctSpotAndColor = 4, correctColor = 4}

presentWinResult :: GuessResult -> String
presentWinResult = undefined

-- simpleParse :: String -> Maybe Color
-- simpleParse input
--   | input == "red" = Just Red
--   | ...
--   | otherwise = Nothing
