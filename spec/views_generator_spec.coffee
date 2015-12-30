testable = require('../bin/generators/views')
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


describe('Generating Routes', ->

  it('Copies the route file', ->
    testable.copyRoutes()
    testDirectory = '../assets/config/routes.coffee'
    assert pathExists(testDirectory) == true
  )

  it('Copies the router', ->
    testable.copyRouter()
    testDirectory = '../assets/scripts/app.coffee'
    assert pathExists(testDirectory) == true
  )

  it('Creates a default route', ->
    testable.createRoute('root', 'test2')
    componentTestFile = '../assets/config/routes.coffee'
    fs.readFile(path.resolve(__dirname, componentTestFile), 'utf8', (err, data) ->
      if (err)
        console.error(err)
      assert data.match('"/": "test2"') == true
    )
  )

  it('Creates a route', ->
    testable.createRoute('test', 'test2')
    componentTestFile = '../assets/config/routes.coffee'
    fs.readFile(path.resolve(__dirname, componentTestFile), 'utf8', (err, data) ->
      if (err)
        console.error(err)
      assert data.match('"/test": "test2"') == true
    )
  )

  it('Creates a route method', ->
    testable.createComponentMethod('test', 'test2')
    componentTestFile = '../assets/config/routes.coffee'
    fs.readFile(path.resolve(__dirname, componentTestFile), 'utf8', (err, data) ->
      if (err)
        console.error(err)
      assert data.match("test2: ->\n    require('./components/test2/test') {}\n\n") == true
    )
  )

)
