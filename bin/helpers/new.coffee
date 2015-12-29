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

  copyIndex: ->
    @copyFile('../../templates/index.html', '../../index.html')
    @copyFile('../../templates/index.html', '../../dist/index.html')

  updatePackage: (appName, author, ghUser, email) ->
    fileName = if componentFolder == functionName then 'index' else functionName
    fs.readFile(path.resolve(__dirname, "../../package.json"), 'utf8', (err, data) ->
      if (err)
        console.error(err)

      result = data.replace(/french-press/g, "#{appName}")
      result = data.replace(/whatisinternet/g, "#{ghUser}")
      result = data.replace(/Josh Teeter/g, "#{author}")
      result = data.replace(/email/g, "#{email}")

      fs.writeFile(path.resolve(__dirname, "../../package.json"), result, (err) ->
        if (err)
          console.error(err)
      )
    )

  updateReadMe: (appName, author, ghUser, email) ->
    fileName = if componentFolder == functionName then 'index' else functionName
    fs.readFile(path.resolve(__dirname, "../../README.md"), 'utf8', (err, data) ->
      if (err)
        console.error(err)

      result = data.replace(/french-press/g, "#{appName}")
      result = data.replace(/French Press/g, "#{appName}")
      result = data.replace(/whatisinternet/g, "#{ghUser}")
      result = data.replace(/Josh Teeter/g, "#{author}")
      result = data.replace(/email/g, "#{email}")

      fs.writeFile(path.resolve(__dirname, "../../README.md"), result, (err) ->
        if (err)
          console.error(err)
      )
    )
