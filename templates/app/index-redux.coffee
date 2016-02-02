require '../assets/styles/index'

ReactRedux = require('react-redux')
Provider = ReactRedux.Provider

{ store } = require('./app/reducers/index.coffee')

App = require("./app/containers/index.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  ReactDOM.render(
    React.createElement(Provider, {store: store},
      React.createElement(App, null)
    )
    document.getElementById('appEntry')
  )
