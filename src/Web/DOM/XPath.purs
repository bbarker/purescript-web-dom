module Web.DOM.Document.XPath (
    evaluate
  , numberValue
  , resultType
  , stringValue
  , NSResolver
  , XPathEvaluator
  , XPathResult
) where

-- import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)

import Web.DOM.Document                       (Document)
import Web.DOM.Document.XPath.ResultType      (ResultType)
--import Web.DOM.Document.XPath.ResultType      as RT
import Web.DOM.Internal.Types (Node)

foreign import data XPathEvaluator :: Type
foreign import data NSResolver :: Type
foreign import data XPathResult :: Type

evaluate ::
  String
  -> Node
  -> Maybe NSResolver
  -> ResultType
  -> Maybe XPathResult
  -> Document
  -> XPathResult
evaluate xpath ctxt nsres resType res doc =
  evaluateNative xpath ctxt (toNullable nsres) resType (toNullable res) doc

foreign import evaluateNative ::
  String
  -> Node
  -> Nullable NSResolver
  -> ResultType
  -> Nullable XPathResult
  -> Document
  -> XPathResult

foreign import resultType :: XPathResult -> ResultType
foreign import numberValue :: XPathResult -> Number
foreign import stringValue :: XPathResult -> String
