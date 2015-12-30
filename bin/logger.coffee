  # action: hash['action']
  # message: hash['message']
  # state: hash['action']
  # status: hash['status']

module.exports = (hash) ->
  console.log hash
  switch hash['status']
    when 'success' then console.info  "[ SUCCESS! ] #{hash['action']} -- #{hash['state']}"
    when 'warn' then console.warn     "[ WARNING! ] #{hash['action']} #{hash['state']}: #{hash['message']}"
    when 'error' then console.error   "[ ERROR!   ] #{hash['action']} failed on #{hash['state']}: #{hash['message']}"
    else console.log "[          ] #{hash['action']} #{hash['state']}: #{hash['message']}"
