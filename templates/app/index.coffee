require '../assets/styles/index'

App = require("./application.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  ReactDOM.render(
    App()
    document.getElementById('appEntry')
  )
