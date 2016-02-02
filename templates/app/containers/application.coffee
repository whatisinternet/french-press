Application = require("../application.coffee")
ReactRedux = require('react-redux')
connect = ReactRedux.connect

mapStateToProps = (state) ->
  changeMe: state

mapDispatchToProps = (dispatch) ->
  dispatch({})

module.exports = connect(mapStateToProps, mapDispatchToProps)(Application)
