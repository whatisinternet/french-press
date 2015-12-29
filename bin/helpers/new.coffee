fs = require('fs-extra')
path = require('path')

module.exports =
  copyFile: (from, to) ->
    try
      fs.copySync(
        path.resolve(__dirname, from),
          path.resolve(__dirname, to))


  pathExists:(p) ->
    try
      fs.statSync(path.resolve(__dirname, p))
      true
    catch e
      false


  copyWebpackConfig: ->
    unless @pathExists('../../config/')
      @copyFile('../../templates/webpack-config/','../../config/')

  copyBaseApp: ->
    unless @pathExists('../../assets/index.coffee')
      @copyFile('../../templates/assets/index.coffee', '../../assets/index.coffee')

  copyBaseStyle: ->
    unless @pathExists('../../assets/styles/')
      @copyFile('../../templates/styles/', '../../assets/styles/')
