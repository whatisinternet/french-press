var webpack = require('webpack');
var base = require('./base.config.js');
base.devServer = {port: 8080}
base.devtool = 'eval'
base.plugins.push(new webpack.HotModuleReplacementPlugin())
module.exports = base
