path = require('path')
views = require('./generators/views.coffee')
app = require('./generators/new.coffee')
exec = require('child_process').exec
__ = require('./logger.coffee')

processTypeArgs = ->
  return "app" unless  process.argv.indexOf('--app') == -1
  return "view" unless  process.argv.indexOf('--view') == -1

processArgsApp= () ->

  resetGit = process.argv.indexOf('--git')

  appNameIndex = process.argv.indexOf('--appName')
  appName = process.argv[appNameIndex + 1]

  authorIndex = process.argv.indexOf('--author')
  author = process.argv[authorIndex + 1]

  ghUserIndex = process.argv.indexOf('--ghUser')
  ghUser = process.argv[ghUserIndex + 1]

  emailIndex = process.argv.indexOf('--email')
  email = process.argv[emailIndex + 1]

  appName: appName
  author: author
  ghUser: ghUser
  email: email
  gitInit: resetGit

processArgsView = ->
  baseIndex = process.argv.indexOf('--view')
  isSlim = process.argv.indexOf('--slim')

  return unless baseIndex > -1
  functionName = process.argv[baseIndex + 1].replace('--', '')
  routePath = functionName

  folderIndex = process.argv.indexOf('--componentFolder')
  componentFolder = process.argv[folderIndex + 1]
  if folderIndex == -1
    componentFolder = functionName

  routeIndex = process.argv.indexOf('--route')
  routePath = process.argv[routeIndex + 1]
  if routeIndex== -1
    routePath = functionName

  slim: isSlim
  functionName: functionName
  componentFolder: componentFolder
  path: routePath

module.exports = ->

  __(action: 'Generate')
  type = processTypeArgs()

  if type == 'app'
    args = processArgsApp()
    if process.argv.length < 5
      __(action: 'Generate APP', state: 'failed', status: 'error')
      return
    __(action: 'Generate APP', state: 'generating')
    app.copyWebpackConfig()
    app.copyBaseStyle()
    app.copyBaseApp()
    app.copyIndex()
    app.updatePackage(args['appName'], args['author'], args['ghUser'], args['email'])
    app.updateReadMe(args['appName'], args['author'], args['ghUser'], args['email'])
    app.gitInit(args['gitInit'])
    __(action: 'Generate APP', state: 'generated', status: 'success')

  else if type == 'view'
    __(action: 'Generate VIEW', state: 'generating')
    args = processArgsView()
    views.copyRoutes()
    views.copyRouter()
    views.copyComponent(args['functionName'], args['componentFolder'], args['slim'])
    views.createRoute(args['path'], args['functionName'])
    views.createComponentMethod(args['functionName'], args['componentFolder'])
    views.createComponent(args['functionName'], args['componentFolder'])
    views.copyStyle(args['componentFolder'])
    views.updateStyles(args['componentFolder'])
    __(action: 'Generate VIEW', state: 'generated', status: 'success')

