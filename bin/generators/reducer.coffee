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
  generateReducer: (reducerName, storeName) ->
    @copyReducer(reducerName)
    @updateReducer(reducerName, storeName)

  copyReducer: (reducerName) ->
    copyFile('../../templates/app/reducers/demo_reducer.coffee',
    "../../app/reducers/#{reducerName}.coffee")


  updateReducer: (reducerName, storeName) ->
    fs.readFile(path.resolve(__dirname, "../../app/reducers/#{reducerName}.coffee"), 'utf8', (err, data) ->
      if (err)
        console.error(err)

      result = data.replace("DEMO", "#{storeName.toUpperCase()}")
      result = result.replace("demo", "#{storeName}")

      fs.writeFile(path.resolve(__dirname, "../../app/reducers/#{reducerName}.coffee"), result, (err) ->
        if (err)
          console.error(err)
      )
    )
