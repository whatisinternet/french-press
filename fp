#! /usr/local/bin/node

'use strict';

require('coffee-script').register();

switch (process.argv[2]) {
  case 'implode':
    require('./bin/implode.coffee')();
    break;
  case 'g':
    require('./bin/generate.coffee')();
    break;
  case 'generate':
    require('./bin/generate.coffee')();
    break;
  case 'clean':
    require('./bin/clean.coffee')();
    break;
  case 'build':
    require('./bin/build.coffee')();
    break;
  case 'run':
    require('./bin/run.coffee')();
    break;
  case 'test':
    require('./bin/test.coffee')();
    break;
  default:
    console.log(process.argv);
}
