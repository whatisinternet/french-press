gulp = require('gulp')
del = require('del')
fs = require('fs-extra')
path = require('path')

gulp.task('implode', ->
  del([
    'gulpfile.js'
  ])
  copyStrippedGulp()
  del([
    'bin/*',
    'bin',
    'templates/*',
    'gulpfile.js'
    'templates',
    'logo.png'
  ])
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
