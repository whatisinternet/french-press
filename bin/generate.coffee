gulp = require('gulp')
fs = require('fs-extra')
path = require('path')
views = require('./helpers/views.coffee')

gulp.task('g', ->
  args = processArgs()

  if args['type'] == 'view'
    views.copyRoutes()
    views.copyRouter()
    views.copyComponent(args['functionName'], args['componentFolder'], args['slim'])
    views.createRoute(args['path'], args['functionName'])
    views.createComponentMethod(args['functionName'], args['componentFolder'])
    views.createComponent(args['functionName'], args['componentFolder'])
)


processArgs = () ->
  baseIndex = process.argv.indexOf('--view')
  isSlim = process.argv.indexOf('--slim')
  type = 'view' unless baseIndex == -1

  return type: null unless baseIndex > -1
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

  type: type
  slim: isSlim
  functionName: functionName
  componentFolder: componentFolder
  path: routePath


