testable = require('../bin/generators/middleware')
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


describe('Generating Middleware', ->

  it('Copies the middleware file', ->
    testable.generateMiddleware('test', 'test')
    testDirectory = '../app/middleware/test.coffee'
    assert pathExists(testDirectory) == true
  )

)
