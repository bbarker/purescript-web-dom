"use strict";

exports.evaluateInternal = function (xpathExpression) {
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


//       --- XPathResult functions ---

exports.resultType = function (xpathResult) {
  return xpathResult.resultType;
};

exports.numberValue = function (xpathResult) {
  return xpathResult.numberValue;
};

exports.stringValue = function (xpathResult) {
  return xpathResult.stringValue;
};

exports.booleanValue = function (xpathResult) {
  return xpathResult.booleanValue;
};

exports.singleNodeValueInternal = function (xpathResult) {
  return xpathResult.singleNodeValue;
};

exports.invalidIteratorState = function (xpathResult) {
  return xpathResult.invalidIteratorState;
};

exports.snapshotLengthInternal = function (xpathResult) {
  return xpathResult.snapshotLength;
};

exports.iterateNextInternal = function (xpathResult) {
  return xpathResult.iterateNext;
};

exports.snapshotItemInternal = function (xpathResult) {
  return function (index) {
    return xpathResult.snapshotItem(index);
  };
};

//       --- namespace resolver functions ---

exports.customNSResolver = function (customRes) {
  var nsResolver = {
    lookupNamespaceURI : customRes
  };
  return nsResolver;
};

exports.createNSResolver = function (nodeResolver) {
  return function (doc) {
    doc.createNSResolver(nodeResolver);
  };
};
