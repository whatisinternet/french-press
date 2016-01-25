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
