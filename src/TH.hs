module TH where

import Language.Haskell.TH
import Language.Haskell.TH.Quote


somE :: QuasiQuoter
somE = QuasiQuoter
    { quoteExp = somE' }

somE' :: String -> Q Exp
somE' ('$':n) = varE $ mkName n
