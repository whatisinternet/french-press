gulp = require('gulp')
exec = require('child_process').exec

gulp.task('compile', ->
  exec('npm run deploy', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
)

gulp.task('run', ->
  exec('npm run app', (err, stdout, stderr) ->
    console.log(stdout)
    console.log(stderr)
  )
)
