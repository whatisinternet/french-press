fs = require('fs-extra')
path = require('path')
exec = require('child_process').exec

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

copySetup = ->
  copyFile('../../templates/test/setup.coffee',
  "../../test/setup.coffee")

copyTest = (functionName, componentFolder) ->
  fileName = if componentFolder == functionName then 'index' else functionName
  copyFile('../../templates/test/demo_spec.coffee',
  "../../test/scripts/components/#{componentFolder}/#{fileName}.coffee")

createTest = (functionName, componentFolder) ->
  fileName = if componentFolder == functionName then 'index' else functionName
  fs.readFile(path.resolve(__dirname, "../../test/scripts/components/#{componentFolder}/#{fileName}.coffee"), 'utf8', (err, data) ->
    if (err)
      console.error(err)

    result = data.replace(/demoFolder/g, "#{componentFolder}")
    result = result.replace(/demo/g, "#{functionName}")

    fs.writeFile(path.resolve(__dirname, "../../test/scripts/components/#{componentFolder}/#{fileName}.coffee"), result, (err) ->
      if (err)
        console.error(err)
    )
  )

module.exports =
  generateTest: (functionName, componentFolder) ->
    copySetup()
    copyTest(functionName, componentFolder)
    createTest(functionName, componentFolder)
    exec('npm test', (err, stdout, stderr) ->
      console.log(stdout)
      console.log(stderr)
    )

