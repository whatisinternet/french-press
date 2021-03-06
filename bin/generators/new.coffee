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
    copyFile('../../templates/webpack-config/','../../config/application/')

copyBaseApp = ->
  unless pathExists('../../app/index.coffee')
    copyFile('../../templates/app/index.coffee', '../../app/index.coffee')

copyBaseAppRedux = ->
  unless pathExists('../../app/index.coffee')
    copyFile('../../templates/app/index-redux.coffee', '../../app/index.coffee')

copyIndexContainer = ->
  unless pathExists('../../app/containers/application.coffee')
    copyFile('../../templates/app/containers/application.coffee', '../../app/containers/index.coffee')

copyBaseStyle = ->
  unless pathExists('../../assets/styles/')
    copyFile('../../templates/styles/', '../../assets/styles/')

copyIndex = ->
  copyFile('../../templates/index.html', '../../index.html')
  copyFile('../../templates/index-production.html', '../../dist/index.html')

createMixinFolder = ->
  try
    fs.mkdirSync(path.resolve(__dirname, '../../app'))
  try
    fs.mkdirSync(path.resolve(__dirname, '../../app/mixins'))

copyMixinFolder = ->
  copyFile('../../templates/app/mixins', '../../app/mixins/')

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
  newAppNoPackageOrReadmeRedux: (appName, ghUser, author, email) ->
    copyWebpackConfig()
    copyBaseAppRedux()
    copyIndexContainer()
    copyBaseStyle()
    copyIndex()
    createMixinFolder()
    copyMixinFolder()

  newAppNoPackageOrReadme: (appName, ghUser, author, email) ->
    copyWebpackConfig()
    copyBaseApp()
    copyBaseStyle()
    copyIndex()
    createMixinFolder()
    copyMixinFolder()

  newAppRedux: (appName, ghUser, author, email) ->
    @newAppNoPackageOrReadmeRedux(appName, ghUser, author, email)
    updatePackage(appName, author, ghUser, email)
    updateReadMe(appName, author, ghUser, email)

  newApp: (appName, ghUser, author, email) ->
    @newAppNoPackageOrReadme(appName, ghUser, author, email)
    updatePackage(appName, author, ghUser, email)
    updateReadMe(appName, author, ghUser, email)
