{div}  = React.DOM

module.exports = React.createFactory React.createClass
  displayName: "demo"

  # https://facebook.github.io/react/docs/component-specs.html
  mixins: []

  # https://facebook.github.io/react/docs/reusable-components.html
  propTypes:
    null

  getInitialState: ->
    #@setState null
    null

  componentWillMount: ->
    # null

  componentDidMount: ->
    # null

  componentWillReceiveProps: (nextProps) ->
    # nextProps

  shouldComponentUpdate: (nextProps, nextState) ->
    # [nextProps, nextState]
    true

  componentWillUpdate: (nextProps, nextState) ->
    # [nextProps, nextState]

  componentDidUpdate: (prevProps, prevState) ->
    # [prevState, prevProps]

  componentWillUnmount: ->
    # null


  render: ->
    {} = @props

    bem = new Bemmer(block: 'demo')

    div className: bem.with(element: '', modifiers: {}),
      "Hello, demo!"
