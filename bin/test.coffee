exec = require('child_process').exec
__ = require('./logger.coffee')

module.exports = ->
  __(action: 'Test', state: 'Starting tests', message: 'Running' )
  exec('npm test', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
