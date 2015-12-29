gulp = require('gulp')
del = require('del')

gulp.task('implode', ->
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

copyStrippedGulp = ->
  copyFile('../../templates/gulpfile.js','../../gulpfile.js')
