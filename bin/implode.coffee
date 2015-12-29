gulp = require('gulp')
del = require('del')
fs = require('fs-extra')
path = require('path')

gulp.task('implode', ->
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
  copyFile('../../templates/gulpfile.js', '../../gulpfile.js')
