module TH where

import Data.HashSet
import Language.Haskell.TH
import Language.Haskell.TH.Quote
import THTH

somE :: QuasiQuoter
somE = QuasiQuoter
    { quoteExp = somE' }

somE' :: String -> Q Exp
somE' ('$':n) = varE $ mkName n

hinsert :: Q Exp
hinsert = do
    let ins = $(localName "insert")
    return $ VarE ins

hinserte :: Q Exp
hinserte = [e|insert|]
