exec = require('child_process').exec
__ = require('./logger.coffee')

module.exports = ->
  __(action: 'Build', state: 'building')
  exec('npm run deploy', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
  __(action: 'Build', state: 'built', status: 'success')
