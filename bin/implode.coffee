gulp = require('gulp')
del = require('del')
fs = require('fs-extra')
path = require('path')
exec = require('child_process').exec

gulp.task('implode', ['clean-project'], ->
  exec('npm prune', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
  exec('npm install', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
)

gulp.task('clean-project', ->
  removals = [
    '../bin',
    '../gulpfile.js',
    '../logo.png'
  ]
  removals.map (fileFolder) ->
    fs.removeSync(path.resolve(__dirname, fileFolder))
  copyStrippedGulp()
  fs.removeSync(path.resolve(__dirname, "../templates"))
)

copyFile = (from, to) ->
  try
    fs.copySync(
      path.resolve(__dirname, from),
        path.resolve(__dirname, to))
  catch e
    console.log e

copyStrippedGulp = ->
  copyFile('../templates/gulpfile.js', '../gulpfile.js')

