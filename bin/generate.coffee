path = require('path')
views = require('./generators/views.coffee')
app = require('./generators/new.coffee')
nav = require('./generators/nav.coffee')
test = require('./generators/test.coffee')
reducer = require('./generators/reducer.coffee')
middleware = require('./generators/middleware.coffee')
exec = require('child_process').exec
__ = require('./logger.coffee')

processTypeArgs = ->
  return "app" unless  process.argv.indexOf('--app') == -1
  return "view" unless  process.argv.indexOf('--view') == -1
  return "component" unless  process.argv.indexOf('--component') == -1
  return "nav" unless  process.argv.indexOf('--navigation') == -1
  return "reducer" unless  process.argv.indexOf('--reducer') == -1
  return "middleware" unless  process.argv.indexOf('--middleware') == -1

processArgsApp = ->

  appNameIndex = process.argv.indexOf('--appName')
  appName = process.argv[appNameIndex + 1]

  authorIndex = process.argv.indexOf('--author')
  author = process.argv[authorIndex + 1]

  ghUserIndex = process.argv.indexOf('--ghUser')
  ghUser = process.argv[ghUserIndex + 1]

  emailIndex = process.argv.indexOf('--email')
  email = process.argv[emailIndex + 1]

  isRedux = if process.argv.indexOf('--redux') == -1 then false else true

  appName: appName
  author: author
  ghUser: ghUser
  email: email
  redux: isRedux

processArgsView = ->
  baseIndex = process.argv.indexOf('--view')
  isSlim = if process.argv.indexOf('--slim') == -1 then false else true

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

processArgsComponent = ->
  baseIndex = process.argv.indexOf('--component')
  isSlim = if process.argv.indexOf('--slim') == -1 then false else true

  return unless baseIndex > -1
  functionName = process.argv[baseIndex + 1].replace('--', '')
  return unless functionName.length > 0
  routePath = functionName

  folderIndex = process.argv.indexOf('--folder')
  componentFolder = process.argv[folderIndex + 1]
  return unless folderIndex > -1

  slim: isSlim
  functionName: functionName
  componentFolder: componentFolder

processArgsReducer= ->
  baseIndex = process.argv.indexOf('--reducer')
  hasMiddleware = if process.argv.indexOf('--middleware') == -1 then false else true

  storeIndex = process.argv.indexOf('--store')
  storeName = process.argv[storeIndex + 1]

  hasMiddleware: hasMiddleware
  storeName: storeName

processArgsMiddleware= ->
  baseIndex = process.argv.indexOf('--middleware')

  storeIndex = process.argv.indexOf('--store')
  storeName = process.argv[storeIndex + 1]

  middlewareIndex = process.argv.indexOf('--name')
  middlewareName = process.argv[middlewareIndex + 1]

  storeName: storeName
  middlewareName: middlewareName

module.exports = ->

  __(action: 'Generate', state: '', message: 'started')
  type = processTypeArgs()

  if type == 'app'
    args = processArgsApp()
    if process.argv.length < 5
      __(action: 'Generate APP', state: 'failed', status: 'error')
      return

    if args['redux'] == true
      __(action: 'Generate APP with Redux', state: 'generating', message: args['appName'])
      app.newAppRedux(args['appName'], args['author'], args['ghUser'], args['email'])
      __(action: 'Generate APP with Redux', state: 'generated', status: 'success')

    else
      __(action: 'Generate APP', state: 'generating', message: args['appName'])
      app.newApp(args['appName'], args['author'], args['ghUser'], args['email'])
      __(action: 'Generate APP', state: 'generated', status: 'success')

  else if type == 'view'
    args = processArgsView()
    __(action: 'Generate VIEW', state: 'generating', message: args['functionName'])
    views.generateView(args['functionName'], args['componentFolder'], args['path'], args['slim'])
    test.generateTest(args['functionName'], args['componentFolder'])
    __(action: 'Generate VIEW', state: 'generated', status: 'success')

  else if type == 'nav'
    __(action: 'Generate NAVIGATION', state: 'generating', message: "")
    nav.generate()
    __(action: 'Generate NAVIGATION', state: 'generated', status: 'success')

  else if type == 'component'
    args = processArgsComponent()
    __(action: 'Generate COMPONENT', state: 'generating', message: args['functionName'])
    views.generateComponent(args['functionName'], args['componentFolder'], args['slim'])
    test.generateTest(args['functionName'], args['componentFolder'])
    __(action: 'Generate COMPONENT', state: 'generated', status: 'success')

  else if type == 'middleware'
    args = processArgsMiddleware()
    __(action: 'Generate MIDDLEWARE', state: 'generating', message: args['middlewareName'])
    middleware.generateMiddleware(args['middlewareName'], args['storeName'])
    __(action: 'Generate MIDDLEWARE', state: 'generated', status: 'success')

  else if type == 'reducer'
    args = processArgsReducer()

    if args['hasMiddleware'] == true
      __(action: 'Generate REDUCER with MIDDLEWARE', state: 'generating', message: args['storeName'])
      reducer.generateReducer(args['storeName'])
      __(action: 'Generate REDUCER with MIDDLEWARE', state: 'generated', status: 'success')

    else
      __(action: 'Generate REDUCER', state: 'generating', message: args['storeName'])
      reducer.generateReducerNoMiddleware(args['storeName'])
      __(action: 'Generate REDUCER', state: 'generated', status: 'success')
