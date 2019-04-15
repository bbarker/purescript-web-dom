module Test.Main where

import Prelude

import Data.Maybe                        (Maybe(..))
import Effect                            (Effect)
import Effect.Aff                        (Aff)
import Effect.Class                      (liftEffect)
import Effect.Console                    (logShow)

import Test.Data                         as TD
import Test.Unit                         (suite, test)
import Test.Unit.Main                    (runTest)
import Test.Unit.Assert                  as Assert

import Web.DOM.Document                  (Document, toNode)
import Web.DOM.DOMParser                 (DOMParser, makeDOMParser, parseXMLFromString)
import Web.DOM.Document.XPath            (evaluate, stringValue)
import Web.DOM.Document.XPath.ResultType as RT
import Web.DOM.Node                      (nodeName)

parseNoteDoc :: DOMParser -> Document
parseNoteDoc dp = parseXMLFromString TD.noteXml dp

main :: Effect Unit
main = runTest do
  suite "non-namespaced tests" do
    test "note.xml" do
      domParser <- liftEffect $ makeDOMParser
      noteDoc <- pure $ parseNoteDoc domParser
      note <- pure $ toNode noteDoc
      tlog $ "string type is: "
      tlog RT.string_type
      tlog $ "got a node: " <> (nodeName note)
      noteTo <- pure $ stringValue $
        evaluate ("/note/to") note Nothing RT.string_type Nothing noteDoc
      tlog $ "got a note to: " <> noteTo
      Assert.equal "foo" ("f" <> "o" <> "o")
      Assert.equal "Tove" noteTo


tlog :: forall a. Show a => a -> Aff Unit
tlog = liftEffect <<< logShow


