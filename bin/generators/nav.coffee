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
  generate: ->
    copyFile('../../templates/app/components/nav/index.coffee',
    "../../app/components/nav/index.coffee")

    copyFile('../../templates/test/nav/index.coffee',
    "../../test/components/nav/index.coffee")

    unless pathExists("../../assets/styles/components/index.sass")
      copyFile('../../templates/styles/index.sass', "../../assets/styles/components/nav.sass")

    imprt = ".nav\n  &__item\n    padding-left: 10px"

    fs.appendFile(path.resolve(__dirname, "../../assets/styles/components/nav.sass"), imprt, (err) ->
      if (err)
        console.error(err)
    )

    imprt = "@import './components/nav.sass'\n"

    fs.appendFile(path.resolve(__dirname, '../../assets/styles/index.sass'), imprt, (err) ->
      if (err)
        console.error(err)
    )
