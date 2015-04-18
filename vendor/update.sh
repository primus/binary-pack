#!/usr/bin/env node

'use strict';

var pkg  = require('js-binarypack/package')
  , browserify = require('browserify')
  , concat = require('concat-stream')
  , derequire = require('derequire')
  , path = require('path')
  , fs = require('fs');

browserify({
  entries: [ path.join(__dirname, 'index.js') ],
}).bundle().pipe(concat({
  encoding: 'string'
}, function (output) {
  var prelude = '/*! binarypack.js build:'+ pkg.version +', production. '+
    'Copyright(c) 2012 Eric Zhang <eric@ericzhang.com> MIT Licensed */';

  fs.writeFileSync(path.join(__dirname, 'binarypack.js'), [
    prelude,
    '(function (context) {',
      derequire(output),
    '})(this);',
    ''
  ].join('\n'));
}));
