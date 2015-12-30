del = require('del')
fs = require('fs-extra')
path = require('path')
exec = require('child_process').exec
__ = require('./logger.coffee')

copyFile = (from, to) ->
  try
    fs.copySync(
      path.resolve(__dirname, from),
        path.resolve(__dirname, to))
  catch e
    console.log e


module.exports = ->
  __(action: 'Implode', state: 'imploding', status: 'warn', message: "please wait")
  removals = [
    '../bin',
    '../fp',
    '../spec',
    '../logo.png'
  ]
  removals.map (fileFolder) ->
    fs.removeSync(path.resolve(__dirname, fileFolder))
  fs.removeSync(path.resolve(__dirname, "../templates"))

  exec('npm prune', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
  exec('npm install', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
  __(action: 'Implode', state: 'imploded', status: 'success')



