module Web.DOM.Document.XPath where

-- import Prelude

import Data.Maybe (Maybe)

import Web.DOM.Document.XPath.ResultType      (ResultType)
--import Web.DOM.Document.XPath.ResultType      as RT
import Web.DOM.Internal.Types (Node)

foreign import data XPathEvaluator :: Type
foreign import data NSResolver :: Type
foreign import data XPathResult :: Type

foreign import evaluate ::
  String
  -> Node
  -> Maybe NSResolver
  -> ResultType
  -> Maybe XPathResult
  -> XPathResult

foreign import stringValue :: XPathResult -> String
