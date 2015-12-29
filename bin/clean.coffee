gulp = require('gulp')
del = require('del')

gulp.task('clean', ->
  return del([
    'dist/images/*',
    'dist/*',
    'dist',
    'assets/config/*',
    'assets/config',
    'assets/scripts/components/app.coffee',
    'assets/scripts/components/*.coffee',
    'assets/scripts/components',
    'assets/scripts/*',
    'assets/scripts',
    'assets',
    'config/*',
    'config',
    'index.html',
  ])
)
