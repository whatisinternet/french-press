module.exports =
  (store) ->
    (next) ->
      (action) ->
        next({type: 'GET_DEMO', demo: {}})
