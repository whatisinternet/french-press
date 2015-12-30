# Hacking out webpack
React = React || require('react')
ReactDOM = ReactDOM || require('react-dom')
Bemmer = Bemmer || require('bemmer-node/bemmer-class')
_ = _ || require('lodash')

{div}  = React.DOM

module.exports = React.createFactory React.createClass
  displayName: "demo"

  # https://facebook.github.io/react/docs/component-specs.html
  mixins: []

  # https://facebook.github.io/react/docs/reusable-components.html
  propTypes:
    null

  render: ->
    {} = @props

    div {},
      "Hello, demo!"
