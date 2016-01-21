jsdom = require('jsdom')

global.document = jsdom.jsdom('<!doctype html><html><body></body></html>')
global.window = document.defaultView
global.navigator = {userAgent: 'node.js'}

global.React = require('react')
global.ReactDOM = require('react-dom')
global.Bemmer =  require('bemmer-node/bemmer-class')
global._ = require('lodash')
