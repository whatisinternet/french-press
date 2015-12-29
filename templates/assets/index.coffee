require './styles/index'

App = require("./scripts/app.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  ReactDOM.render(
    App()
    document.getElementById('appEntry')
  )
