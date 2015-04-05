var webpack = require("webpack");

module.exports = {
  entry: ["webpack-dev-server/client?http://localhost:8080", 'webpack/hot/dev-server','./src/js/sudoku.jsx.coffee'],

  output: {
    path: __dirname + "/src/js/",

    filename: 'bundle.js',

    publicPath: 'http://localhost:8080/js/',

    sourceMapFilename: '[file].map'
  },

  resolve: {
    extensions: ['', '.js', '.jsx', '.jsx.coffee', '.coffee']
  },

  module: {
    loaders: [
      { test: /\.jsx.coffee$/, loader: 'react-hot!jsx?harmony!coffee', exclude: /node_modules/ },
      { test: /\.coffee$/, loader: 'coffee-loader', exclude: /\.jsx.coffee$|node_modules/ },
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
