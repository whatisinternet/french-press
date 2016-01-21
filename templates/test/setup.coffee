jsdom = require('jsdom')

global.document = jsdom.jsdom('<!doctype html><html><body></body></html>')
global.window = document.defaultView
global.navigator = {userAgent: 'node.js'}

React = require('react')
ReactDOM = require('react-dom')
Bemmer =  require('bemmer-node/bemmer-class')
_ = require('lodash')
