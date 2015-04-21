module Main where

import Language.Haskell.TH
import TH


x = 321

main :: IO ()
main = do
    print $(let  x = [e|123|]
                 y = [e|$x|]
            in y)

    print $(let  x = [e|123|]
                 y = [somE|$x|]
            in y)

    print $(let  x = [e|123|]
            in varE (mkName "x"))
