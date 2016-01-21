path = require('path')
views = require('./generators/views.coffee')
app = require('./generators/new.coffee')
test = require('./generators/test.coffee')
exec = require('child_process').exec
__ = require('./logger.coffee')

processTypeArgs = ->
  return "app" unless  process.argv.indexOf('--app') == -1
  return "view" unless  process.argv.indexOf('--view') == -1
  return "component" unless  process.argv.indexOf('--component') == -1

processArgsApp= () ->

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

processArgsView = ->
  baseIndex = process.argv.indexOf('--view')
  isSlim = if process.argv.indexOf('--slim') == -1 then false else true
  console.log isSlim

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

processArgsComponent= ->
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

module.exports = ->

  __(action: 'Generate')
  type = processTypeArgs()

  if type == 'app'
    args = processArgsApp()
    if process.argv.length < 5
      __(action: 'Generate APP', state: 'failed', status: 'error')
      return
    __(action: 'Generate APP', state: 'generating')
    app.newApp(args['appName'], args['author'], args['ghUser'], args['email'])
    __(action: 'Generate APP', state: 'generated', status: 'success')

  else if type == 'view'
    __(action: 'Generate VIEW', state: 'generating')
    args = processArgsView()
    views.generateView(args['functionName'], args['componentFolder'], args['path'], args['slim'])
    test.generateTest(args['functionName'], args['componentFolder'])
    __(action: 'Generate VIEW', state: 'generated', status: 'success')

  else if type == 'component'
    __(action: 'Generate COMPONENT', state: 'generating')
    args = processArgsComponent()
    views.generateComponent(args['functionName'], args['componentFolder'], args['slim'])
    test.generateTest(args['functionName'], args['componentFolder'])
    __(action: 'Generate COMPONENT', state: 'generated', status: 'success')
