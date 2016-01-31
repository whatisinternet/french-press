assert = require('assert')
React = require('react')
Testable = require('../../../app/components/nav/index.coffee')
TestUtils = require('react-addons-test-utils')

describe('Navigation component', ->

  before('render and locate element', ->
    renderedComponent = TestUtils.renderIntoDocument(
      Testable {}
    )

    contents = TestUtils.scryRenderedComponentsWithType(
      renderedComponent, 'a'
    )

    @elements = contents

    @routes = require('../../../config/routes')
  )

  it("each element contains a route", ->
    _.each @elements, (element) ->
      assert(_.includes(_.values(@routes), element.innerHTML))
  )

  it("should contain the same number of elements as there are routes", ->
    assert(@routes.length == @elements.length)
  )
)
