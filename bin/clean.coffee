del = require('del')
__ = require('./logger.coffee')

module.exports = ->
  __(action: 'Clean', state: 'Cleaning')
  del([
    'test/*',
    'test',
    'dist/images/*',
    'dist/*',
    'dist',
    'assets/config/*',
    'assets/config',
    'assets/scripts/components/app.coffee',
    'assets/scripts/components/*.coffee',
    'assets/scripts/components',
    'assets/scripts/*',
    'assets/scripts',
    'assets',
    'config/*',
    'config',
    'index.html',
  ])
  __(action: 'Clean', state: 'cleaned', status: 'success')
