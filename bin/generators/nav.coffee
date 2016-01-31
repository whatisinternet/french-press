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
  generateNav: ->
    copyFile('../../templates/app/components/nav/index.coffee',
    "../../app/components/nav/index.coffee")

    copyFile('../../templates/test/nav/index.coffee',
    "../../test/components/nav/index.coffee")
