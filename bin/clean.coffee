del = require('del')
__ = require('./logger.coffee')

module.exports = ->
  __(action: 'Clean', state: 'Cleaning', status: '')
  del([
    'test/*',
    'test',
    'dist/images/*',
    'dist/*',
    'dist',
    'app/components/app.coffee',
    'app/components/*.coffee',
    'app/components',
    'app/*',
    'app',
    'assets',
    'config/*',
    'config',
    'index.html',
  ])
  __(action: 'Clean', state: 'cleaned', status: 'success')
