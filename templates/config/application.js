var webpack = require('webpack')
var WebpackDevServer = require('webpack-dev-server')
var config = require('./application/webpack.config')

new WebpackDevServer(webpack(config),{
  publicPath: config.output.publicPath,
  hot: true,
  historyApiFallback: true
}).listen(8080, 'localhost', function (err, result) {
  if (err) {
    console.log(err)
  }

  console.log('Server is now running on localhost:8080')

});

