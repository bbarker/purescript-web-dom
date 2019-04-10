module Test.Main where

import Prelude

import Effect                               (Effect)
import Effect.Class                         (liftEffect)
import Effect.Console                       (log)

import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert

main :: Effect Unit
main = runTest do
  suite "sync code" do
    test "arithmetic" do
      liftEffect $ log "hi2!!!!!!!"
      Assert.assert "2 + 2 should be 4" $ (2 + 2) == 4
      Assert.assertFalse "2 + 2 shouldn't be 5" $ (2 + 2) == 5
      Assert.equal 4 (2 + 2)
      Assert.expectFailure "2 + 2 shouldn't be 5" $ Assert.equal 5 (2 + 2)
