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

describe('Generating Component', ->

  it('Copies the Component file slim', ->
    testable.copyComponent('test', 'test2', true)
    testDirectory = '../assets/scripts/components/test2/test.coffee'
    assert pathExists(testDirectory) == true
  )

  it('Copies the slim template when requested', ->
    testable.copyComponent('test', 'test2', true)
    componentTestFile = '../assets/scripts/components/test2/test.coffee'
    fs.readFile(path.resolve(__dirname, componentTestFile), 'utf8', (err, data) ->
      if (err)
        console.error(err)
      assert data.match("componentWillMount") == false
    )
  )

  it('Copies the Component file full', ->
    testable.copyComponent('test', 'test3', false)
    testDirectory = '../assets/scripts/components/test3/test.coffee'
    assert pathExists(testDirectory) == true
  )

  it('Copies the full template when requested', ->
    testable.copyComponent('test', 'test3', false)
    componentTestFile = '../assets/scripts/components/test3/test.coffee'
    fs.readFile(path.resolve(__dirname, componentTestFile), 'utf8', (err, data) ->
      if (err)
        console.error(err)
      assert data.match("componentWillMount") == true
    )
  )

)

describe('Generating Style', ->

  it('Copies style file', ->
    testable.copyStyle('test4')
    testDirectory = '../assets/styles/components/test4.sass'
    assert pathExists(testDirectory) == true
  )

  it('Generates an import for the index sass file', ->
    testable.updateStyles('test4')
    componentTestFile = '../assets/styles/index.sass'
    fs.readFile(path.resolve(__dirname, componentTestFile), 'utf8', (err, data) ->
      if (err)
        console.error(err)
      assert data.match("@import './components/test4.sass'") == false
    )
  )

)
