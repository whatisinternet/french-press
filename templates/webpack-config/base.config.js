var path = require('path');
var webpack = require('webpack');

module.exports = {

  entry: [
    'webpack-dev-server/client?http://0.0.0.0:8080',
    'webpack/hot/only-dev-server',
    './app/index.coffee'
  ],

  output: {
    path: path.join(__dirname, 'dist'),
    publicPath: '/',
    filename: "app.entry.js"
  },

  module: {
    loaders: [
      { test: /\.coffee$/, loaders: ["react-hot", "coffee-loader"] },
      { test: /\.(png|jpg)$/, loader: "file-loader?name=images/[name].[ext]" },
      { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff" },
      { test: /\.(ttf|eot|svg)(\?v=[1-9]\.[0-9]\.[0-9])?$/, loader: "file-loader"},
      { test: /\.woff(2)?\?\-hdf3wh?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff" },
      { test: /\.(ttf|eot|svg)\?\-hdf3wh$/, loader: "url-loader"},
      { test: /\.(ttf|eot|svg)$/, loader: "url-loader"},
      { test: /\.woff$/i, loader: "url-loader?limit=20000&mimetype=application/font-woff" },
      { test: /\.css$/, loader: "style!css" },
      { test: /\.sass$/, loader: "style-loader!css-loader!sass?indentedSyntax" }
    ]
  },
  resolve: {
    extensions: ["", ".js", ".coffee", ".sass", ".css",  "eot", "svg", "ttf", "woff", "woff2"]
  },

  plugins: [
    new webpack.ProvidePlugin({
      "React": "react",
      "ReactDOM": "react-dom",
      "_": "lodash",
      "Bemmer": "bemmer-node/bemmer-class"
    })
    ],
}
