require '../assets/styles/index'

ReactRedux = require('react-redux')
Provider = ReactRedux.Provider

{ store } = require('./reducers/index.coffee')

App = require("./containers/index.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  ReactDOM.render(
    React.createElement(Provider, {store: store},
      React.createElement(App, null)
    )
    document.getElementById('appEntry')
  )
