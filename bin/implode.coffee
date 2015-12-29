gulp = require('gulp')
del = require('del')

gulp.task('implode', ->
  return del([
    'bin/*',
    'bin',
    'templates/*',
    'templates',
    'gulpfile.js',
    'logo.png'
  ])
)
