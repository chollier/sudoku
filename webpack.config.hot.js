var webpack = require("webpack");

module.exports = {
  entry: ["webpack-dev-server/client?http://localhost:8080", 'webpack/hot/dev-server','./src/js/app.jsx.coffee'],

  output: {
    path: __dirname + "/src/js/",

    filename: 'bundle.js',

    publicPath: 'http://localhost:8080/js/',

    sourceMapFilename: '[file].map'
  },

  resolve: {
    extensions: ['', '.cjsx', '.coffee']
  },

  resolveLoader: {
    modulesDirectories: ['node_modules']
  },

  module: {
    loaders: [
      { test: /\.cjsx$/, loaders: ['coffee', 'cjsx'], exclude: /node_modules/ },
      { test: /\.coffee$/, loader: 'coffee-loader', exclude: /node_modules/ },
    ]
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ],

  devServer: {
    stats: {colors: true},
    contentBase: 'http://localhost:8090/',
    hot: true
  },

  devtool: "eval"

};
