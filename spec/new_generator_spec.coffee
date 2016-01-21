testable = require('../bin/generators/new')
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


describe('Generating a new app', ->

  before(->
    testable.newAppNoPackageOrReadme('test', 'test', 'test', 'test')
  )

  it('generates webpack config folder', ->
    testDirectory = '../config/'
    assert pathExists(testDirectory) == true
  )

  it('generates a base webpack config', ->
    testDirectory = '../config/base.config.js'
    assert pathExists(testDirectory) == true
  )

  it('generates a dev webpack config', ->
    testDirectory = '../config/webpack.config.js'
    assert pathExists(testDirectory) == true
  )

  it('generates a production webpack config', ->
    testDirectory = '../config/webpack.production.config.js'
    assert pathExists(testDirectory) == true
  )

  it('generates the base assets directory', ->
    testDirectory = '../assets/'
    assert pathExists(testDirectory) == true
  )

  it('generates the base app.coffee', ->
    testDirectory = '../assets/index.coffee'
    assert pathExists(testDirectory) == true
  )

  it('generates the base style directory', ->
    testDirectory = '../assets/styles/'
    assert pathExists(testDirectory) == true
  )

  it('generates the base style', ->
    testDirectory = '../assets/styles/index.sass'
    assert pathExists(testDirectory) == true
  )

  it('generates dev index.html', ->
    testDirectory = '../index.html'
    assert pathExists(testDirectory) == true
  )

  it('generates dist folder', ->
    testDirectory = '../dist'
    assert pathExists(testDirectory) == true
  )

  it('generates production index.html', ->
    testDirectory = '../dist/index.html'
    assert pathExists(testDirectory) == true
  )

  it('generates a mixin folder', ->
    testDirectory = '../assets/scripts/mixins'
    assert pathExists(testDirectory) == true
  )

)
