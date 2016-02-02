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
  generateMiddleware: (middlewareName, storeName) ->
    @copyMiddleware(middlewareName)
    @updateMiddleware(middlewareName, storeName)

  copyComponent: (middlewareName) ->
    copyFile('../../templates/app/middleware/demo_middleware.coffee',
    "../../app/middleware/#{middlewareName}.coffee")


  updateMiddleware: (middlewareName, storeName) ->
    fs.readFile(path.resolve(__dirname, "../../app/middleware/#{middlewareName}.coffee"), 'utf8', (err, data) ->
      if (err)
        console.error(err)

      result = data.replace("DEMO", "#{storeName.toUpperCase()}")
      result = result.replace("demo", "#{storeName}")

      fs.writeFile(path.resolve(__dirname, "../../app/middleware/#{middlewareName}.coffee"), result, (err) ->
        if (err)
          console.error(err)
      )
    )
