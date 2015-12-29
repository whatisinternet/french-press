gulp = require('gulp')
path = require('path')
views = require('./helpers/views.coffee')
app = require('./helpers/new.coffee')

gulp.task('g', ->
  type = processTypeArgs()

  if type == 'app'
    app.copyWebpackConfig()
    app.copyBaseStyle()
    app.copyBaseApp()
    app.copyIndex()

  else if type == 'view'
    args = processArgsView()
    views.copyRoutes()
    views.copyRouter()
    views.copyComponent(args['functionName'], args['componentFolder'], args['slim'])
    views.createRoute(args['path'], args['functionName'])
    views.createComponentMethod(args['functionName'], args['componentFolder'])
    views.createComponent(args['functionName'], args['componentFolder'])
    views.copyStyle(args['componentFolder'])
    views.updateStyles(args['componentFolder'])
)

processTypeArgs = ->
  return "app" unless  process.argv.indexOf('--app') == -1
  return "view" unless  process.argv.indexOf('--view') == -1

processArgsView = () ->
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



