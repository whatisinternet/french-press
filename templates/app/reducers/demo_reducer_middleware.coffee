demoMiddleware = require('../middleware/demoMiddleware')
{createStore, applyMiddleware} = require('redux')

demoStore = (state = {demo: {}}, action) ->
  switch action.type
    when 'GET_DEMO'
      _.extend state['demo'], action.demo
    else
      return state

createStoreWithMiddleware = applyMiddleware(demoMiddleware)(createStore)
module.exports = store: createStoreWithMiddleware(demoStore)
