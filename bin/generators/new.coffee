fs = require('fs-extra')
path = require('path')
exec = require('child_process').exec
del = require('del')

copyFile = (from, to) ->
  try
    fs.copySync(
      path.resolve(__dirname, from),
        path.resolve(__dirname, to))


pathExists = (p) ->
  try
    fs.statSync(path.resolve(__dirname, p))
    true
  catch e
    false

copyWebpackConfig = ->
  unless pathExists('../../config/')
    copyFile('../../templates/webpack-config/','../../config/')

copyBaseApp = ->
  unless pathExists('../../assets/index.coffee')
    copyFile('../../templates/assets/index.coffee', '../../assets/index.coffee')

copyBaseStyle = ->
  unless pathExists('../../assets/styles/')
    copyFile('../../templates/styles/', '../../assets/styles/')

copyIndex = ->
  copyFile('../../templates/index.html', '../../index.html')
  copyFile('../../templates/index-production.html', '../../dist/index.html')

copyMixinFolder = ->
  copyFile('../../templates/scripts/mixins/', '../../assets/scripts/mixins/')

updatePackage = (appName, author, ghUser, email) ->
  fs.readFile(path.resolve(__dirname, "../../package.json"), 'utf8', (err, data) ->
    if (err)
      console.error(err)

    result = data.replace("french-press", "#{appName}")
    result = result.replace("French-Press", "#{appName}")
    result = result.replace("French Press", "#{appName}")
    result = result.replace("whatisinternet", "#{ghUser}")
    result = result.replace("Josh Teeter", "#{author}")

    fs.writeFile(path.resolve(__dirname, "../../package.json"), result, (err) ->
      if (err)
        console.error(err)
    )
  )

updateReadMe = (appName, author, ghUser, email) ->
  fs.readFile(path.resolve(__dirname, "../../README.md"), 'utf8', (err, data) ->
    if (err)
      console.error(err)

    result = data.replace("french-press", "#{appName}")
    result = result.replace("French-Press", "#{appName}")
    result = result.replace("French Press", "#{appName}")
    result = result.replace("whatisinternet", "#{ghUser}")
    result = result.replace("Josh Teeter", "#{author}")

    fs.writeFile(path.resolve(__dirname, "../../README.md"), result, (err) ->
      if (err)
        console.error(err)
    )
  )

module.exports =
  newAppNoPackageOrReadme: (appName, ghUser, author, email) ->
    copyWebpackConfig()
    copyBaseApp()
    copyBaseStyle()
    copyIndex()
    copyMixinFolder()

  newApp: (appName, ghUser, author, email) ->
    @newAppNoPackageOrReadme(appName, ghUser, author, email)
    updatePackage(appName, author, ghUser, email)
    updateReadMe(appName, author, ghUser, email)
