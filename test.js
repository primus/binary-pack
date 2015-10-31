describe('binary-pack', function () {
  'use strict';

  var binarypack = require('binarypack')
    , read = require('fs').readFileSync
    , join = require('path').join
    , assert = require('assert')
    , bpack = require('./');

  it('exports the server-side component', function () {
    assert.strictEqual(bpack, binarypack);
  });

  it('exports the client-side component', function () {
    var source = read(join(__dirname, 'vendor/binarypack.js'), 'utf-8');

    assert.strictEqual(bpack.BrowserSource, source);
  });
});
