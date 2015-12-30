exec = require('child_process').exec

module.exports = ->
  exec('npm run app', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
