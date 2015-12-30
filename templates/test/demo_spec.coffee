assert = require('assert')
React = require('react')
Testable = require('../../../../assets/scripts/components/demoFolder/demoFile.coffee')
TestUtils = require('react-addons-test-utils')

describe('demo test', ->

  before('render and locate element', ->
    renderedComponent = TestUtils.renderIntoDocument(
      Testable {}
    )

    content = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'div'
    )

    @element = content

  )

  it('<div> contains "Hello, demo!"', ->
    assert(@element.innerHTML == "Hello, demo!")
  )

)
