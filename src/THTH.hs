module THTH where

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

localName :: String -> Q Exp
localName ln = lookupValueName ln >>= \case
    Nothing -> fail "fuck !"
    Just n  -> liftName n


liftName (Name (OccName occn) flav) = [e|Name $(occName) $(nameFlavour)|]
  where
    occName = [e|OccName $(litE $ stringL occn)|]
    nameFlavour = case flav of
        -- NameS                -> [e|NameS|]
        -- NameQ (ModName modn) -> [e|NameQ (ModName $(litE $ stringL modn))|]
        NameG ns (PkgName pkgn) (ModName modn) ->
            [e|NameG $(nse) (PkgName $(litE $ stringL pkgn)) (ModName $(litE $ stringL modn))|]
          where
            nse = case ns of
                VarName   -> [e|VarName|]
                DataName  -> [e|DataName|]
                TcClsName -> [e|TcClsName|]
