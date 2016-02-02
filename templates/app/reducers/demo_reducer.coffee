{createStore} = require('redux')

demoStore = (state = {demo: {}}, action) ->
  switch action.type
    when 'GET_DEMO'
      _.extend state['demo'], action.demo
    else
      return state

module.exports = store: createStore(demoStore)
