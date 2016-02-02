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
  generateReducer: (reducerName, middlewareName) ->
    @copyReducer(reducerName)
    @updateReducer(reducerName, middlewareName)

  generateReducerNoMiddleware: (reducerName) ->
    @copyReducerNoMiddleware(reducerName)
    @updateReducer(reducerName, reducerName)

  copyReducer: (reducerName) ->
    copyFile('../../templates/app/reducers/demo_reducer_middleware.coffee',
    "../../app/reducers/#{reducerName}.coffee")

  copyReducerNoMiddleware: (reducerName) ->
    copyFile('../../templates/app/reducers/demo_reducer.coffee',
    "../../app/reducers/#{reducerName}.coffee")


  updateReducer: (reducerName, middlewareName) ->
    fs.readFile(path.resolve(__dirname, "../../app/reducers/#{reducerName}.coffee"), 'utf8', (err, data) ->
      if (err)
        console.error(err)

      result = data.replace("DEMO", "#{reducerName.toUpperCase()}")
      result = result.replace(new RegExp('demo', 'g'), "#{reducerName}")
      result = result.replace(new RegExp('demoMiddleware', 'g'), "#{middlewareName}")

      fs.writeFile(path.resolve(__dirname, "../../app/reducers/#{reducerName}.coffee"), result, (err) ->
        if (err)
          console.error(err)
      )
    )
