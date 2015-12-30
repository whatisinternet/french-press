testable = require('../../../bin/generators/test')
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


describe('Generating tests for components', ->

  before(->
    testable.generateTest('test', 'test')
  )

  it('generates a test folder', ->
    testDirectory = '../../../test/'

    assert pathExists(testDirectory) == true
  )

  it('generates a setup.coffee file', ->
    setupFile = '../../../test/setup.coffee'

    assert pathExists(setupFile) == true
  )

  it('generates a test for the component test/index.coffee', ->
    componentTestFile = '../../../test/scripts/components/test/index.coffee'

    assert pathExists(componentTestFile) == true
  )

  it('test/index.coffee has no references to demo', ->
    componentTestFile = '../../../test/scripts/components/test/index.coffee'
    fs.readFile(path.resolve(__dirname, componentTestFile), 'utf8', (err, data) ->
      if (err)
        console.error(err)
      assert data.match(/demo/ig) == false
    )
  )
)
