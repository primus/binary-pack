/*
 * index.js :: include for the binarypack modules
 *
 * (C) 2013 Jarrett Cruger -- MIT
 *
 */

var read = require('fs').readFileSync
  , join = require('path').join;

exports = module.exports = require('binarypack');

//
// Expose source of browser code to be loaded by primus.
//
exports.BrowserSource = read(join(__dirname, 'vendor/binarypack.js'), 'utf-8');
