"use strict";

exports.evaluate = function (xpathExpression) {
  return function (contextNode) {
    return function (namespaceResolver) {
      return function (resultType) {
        return function (result) {
          return function (doc) {
            return function () {
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
};

exports.stringValue = function (xpathResult) {
  return xpathResult.stringValue;
};

