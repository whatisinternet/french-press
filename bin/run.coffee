exec = require('child_process').exec
__ = require('./logger.coffee')

module.exports = ->
  __(action: 'Run', state: 'running', message: 'Goto: http://localhost:8080')
  exec('npm run app', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
  __(action: 'Run', state: 'running', status: 'success')
