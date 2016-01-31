var webpack = require('webpack');
var base = require('./base.config.js');
base.entry = {full: './app/index.coffee'}
base.output = {path: './dist', publicPath: '/', filename: 'app.entry.js'}
base.plugins = [new webpack.ProvidePlugin({
  "React": "react",
  "ReactDOM": "react-dom",
  "_": "lodash",
  "Bemmer": "bemmer-node/bemmer-class"})]
module.exports = base
