{RouterMixin} = require('react-mini-router')

{navigate} = require('react-mini-router')

module.exports = React.createFactory React.createClass
  displayName: "App"

  mixins: [RouterMixin]

  routes: require('../config/routes')

  render: ->
    @renderCurrentRoute()

