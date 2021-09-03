const { webpackConfig, merge } = require('@rails/webpacker')
const customConfig = {
  resolve: {
    // extensions: ['.css', '.js', '.erb']
  }
}

module.exports = merge(webpackConfig, customConfig)
