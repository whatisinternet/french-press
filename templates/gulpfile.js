'use strict';

var gulp = require('gulp');
var exec = require('child_process').exec;

gulp.task('compile', function() {
  exec('npm run deploy', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});

gulp.task('run', function() {
  exec('npm run app', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});
