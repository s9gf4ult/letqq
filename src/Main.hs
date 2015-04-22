module Main where

import Data.HashSet        (singleton)
import Language.Haskell.TH
import TH

x = 321

main :: IO ()
main = do
    let i = $(hinsert)
    let ii = $(hinserte)
    print $ i  2 (singleton (1 :: Int))
    print $ ii 2 (singleton (1 :: Int))
