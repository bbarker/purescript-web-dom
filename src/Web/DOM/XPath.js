"use strict";

exports.evaluateNative = function (xpathExpression) {
  return function (contextNode) {
    return function (namespaceResolver) {
      return function (resultType) {
        return function (result) {
          return function (doc) {
            return doc.evaluate(
              xpathExpression
              , contextNode
              , namespaceResolver
              , resultType
              , result
            );
          };
        };
      };
    };
  };
};

exports.stringValue = function (xpathResult) {
  return xpathResult.stringValue;
};

