testable = require('../bin/generators/nav')
del = require('del')
assert = require('assert')
path = require('path')
fs = require('fs-extra')

pathExists = (p) ->
  try
    fs.statSync(path.resolve(__dirname, p))
    true
  catch e
    false


describe('Generating navigation', ->

  it('Copies the nav', ->
    testable.generate()
    testDirectory = '../app/components/nav/index.coffee'
    assert pathExists(testDirectory) == true
  )

)

describe('Generating Style', ->

  it('Copies style file', ->
    testable.generate()
    testDirectory = '../assets/styles/components/nav.sass'
    assert pathExists(testDirectory) == true
  )

)
