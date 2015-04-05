#!/usr/bin/env node

'use strict';

var pkg  = require(require.resolve('js-binarypack/package'))
  , browserify = require('browserify')
  , concat = require('concat-stream')
  , derequire = require('derequire')
  , path = require('path')
  , fs = require('fs');

browserify({
  entries: [ path.join(__dirname, 'index.js') ],
  standalone: 'BinaryPack',
}).bundle().pipe(concat({
  encoding: 'string'
}, function (output) {
  var prelude = '/*! binarypack.js build:'+ pkg.version +', production. '+
    'Copyright(c) 2012 Eric Zhang <eric@ericzhang.com> MIT Licensed */\n';

  fs.writeFileSync(
    path.join(__dirname, 'binarypack.js'),
    prelude + derequire(output)
  );
}));
