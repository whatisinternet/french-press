fs = require('fs-extra')
path = require('path')

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

module.exports =
  generateView: (functionName, componentFolder, route, slim) ->
    @copyRoutes()
    @copyRouter()
    @copyComponent(functionName, componentFolder, slim)
    @createRoute(route, functionName)
    @createComponentMethod(functionName, componentFolder)
    @createComponent(functionName, componentFolder)
    @copyStyle(componentFolder)
    @updateStyles(componentFolder)


  generateComponent: (functionName, componentFolder, slim) ->
    @copyComponent(functionName, componentFolder, slim)
    @createComponent(functionName, componentFolder)
    @copyStyle(componentFolder)
    @updateStyles(componentFolder)


  copyRoutes: ->
    unless pathExists('../../assets/config/routes.coffee')
      copyFile('../../templates/config/','../../assets/config/')


  copyRouter: ->
    unless pathExists('../../assets/scripts/app.coffee')
      copyFile('../../templates/scripts/app.coffee', '../../assets/scripts/app.coffee')


  copyStyle: (componentFolder) ->
    unless pathExists("../../assets/styles/components/#{componentFolder}.sass")
      copyFile('../../templates/styles/index.sass', "../../assets/styles/components/#{componentFolder}.sass")


  copyComponent: (functionName, componentFolder, slim) ->
    fileName = if componentFolder == functionName then 'index' else functionName
    if slim
      copyFile('../../templates/scripts/demo_slim.coffee',
      "../../assets/scripts/components/#{componentFolder}/#{fileName}.coffee")
    else
      copyFile('../../templates/scripts/demo.coffee',
      "../../assets/scripts/components/#{componentFolder}/#{fileName}.coffee")


  createRoute: (routePath, functionName) ->
    route = if routePath == "root"
        "  '/': '" + functionName  + "'\n"
      else
        "  '/" + routePath + "': '" + functionName  + "'\n"

    fs.appendFile(path.resolve(__dirname, '../../assets/config/routes.coffee'), route, (err) ->
      if (err)
        console.error(err)
    )


  updateStyles: (componentFolder) ->
    imprt = "@import './components/#{componentFolder}.sass'\n"

    fs.appendFile(path.resolve(__dirname, '../../assets/styles/index.sass'), imprt, (err) ->
      if (err)
        console.error(err)
    )


  createComponent: (functionName, componentFolder) ->
    fileName = if componentFolder == functionName then 'index' else functionName
    fs.readFile(path.resolve(__dirname, "../../assets/scripts/components/#{componentFolder}/#{fileName}.coffee"), 'utf8', (err, data) ->
      if (err)
        console.error(err)

      result = data.replace(/demo/g, "#{functionName}")

      fs.writeFile(path.resolve(__dirname, "../../assets/scripts/components/#{componentFolder}/#{fileName}.coffee"), result, (err) ->
        if (err)
          console.error(err)
      )
    )


  createComponentMethod: (functionName, componentFolder) ->
    fileName = if componentFolder == functionName then 'index' else functionName
    fn = "  #{functionName}: ->\n    require('./components/#{componentFolder}/#{fileName}') {}\n\n"
    fs.appendFile(path.resolve(__dirname, '../../assets/scripts/app.coffee'), fn, (err) ->
      if (err)
        console.error(err)
    )
