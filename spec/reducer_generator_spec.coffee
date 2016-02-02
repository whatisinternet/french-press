testable = require('../bin/generators/reducer')
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


describe('Generating Reducer', ->

  it('Copies the reducer file', ->
    testable.generateReducer('test')
    testDirectory = '../app/reducers/test.coffee'
    assert pathExists(testDirectory) == true
  )

)
