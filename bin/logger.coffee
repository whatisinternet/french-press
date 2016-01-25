clc = require('cli-color')

module.exports = (hash) ->
  switch hash['status']
    when 'success' then console.info clc.green  "[ SUCCESS! ] #{hash['action']} -- #{hash['state']}"
    when 'warn' then console.warn    clc.yellow.bgBlack "[ WARNING! ] #{hash['action']} #{hash['state']}: #{hash['message']}"
    when 'error' then console.error  clc.black.bgRed.bold  "[ ERROR!   ] #{hash['action']} failed on #{hash['state']}: #{hash['message']}"
    else console.log clc.white "[          ] #{hash['action']} #{hash['state'] || ""}: #{hash['message'] || ""}"
