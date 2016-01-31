assert = require('assert')
React = require('react')
Testable = require('../../../app/components/nav/index.coffee')
TestUtils = require('react-addons-test-utils')
routes = require('../../../config/routes.coffee')

describe('Navigation component', ->

  before('render and locate element', ->
    renderedComponent = TestUtils.renderIntoDocument(
      Testable {}
    )

    contents = TestUtils.scryRenderedDOMComponentsWithClass(
      renderedComponent, 'nav__item'
    )

    @elements = contents
  )

  it("Each element contains a route", ->
    _.each @elements, (element) ->
      assert(_.includes(_.values(routes), element.innerHTML.toLowerCase().replace(" ", "")))
  )

  it("Should contain the same number of elements as there are routes", ->
    assert(_.values(routes).length == @elements.length)
  )
)

