___INFO___

{
  "type": "MACRO",
  "id": "cvt_dev_attribution_parser",
  "version": 1,
  "displayName": "Attribution JSON Parser",
  "containerContexts": [
    "SERVER"
  ],
  "categories": [
    "UTILITY"
  ],
  "securityGroups": []
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "jsonInput",
    "displayName": "Attribution JSON string",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "path",
    "displayName": "Dot-notation path (e.g. first_touch.gclid)",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

var JSON = require('JSON');
var getType = require('getType');
var makeString = require('makeString');
var input = data.jsonInput || '{}';
var path = data.path || '';
var parsed = JSON.parse(input);
var parts = path.split('.');
var result = parsed;

for (var i = 0; i < parts.length; i++) {
  var part = parts[i];
  if (result == null || getType(result) !== 'object') {
    return '';
  }
  result = result[part];
  if (result === undefined) {
    return '';
  }
}

if (getType(result) === 'object' || getType(result) === 'array') {
  return JSON.stringify(result);
}
return makeString(result);


___TESTS___

scenarios: []


___NOTES___

Parses attribution JSON and extracts values via dot-notation paths.


