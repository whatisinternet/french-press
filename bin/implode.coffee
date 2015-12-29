gulp = require('gulp')
del = require('del')
fs = require('fs-extra')
path = require('path')

gulp.task('implode', ->
  copyStrippedGulp()
  return del([
    'bin/*',
    'bin',
    'templates/*',
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
