var base = require('./base.config.js');
base.entry = {full: './app/index.coffee'}
base.output = {path: './dist', publicPath: '/', filename: 'app.entry.js'}
module.exports = base
