const path = require('path');

var webpack = require("webpack");
var output_root = path.resolve(__dirname, '..', 'app', 'assets', 'javascripts');
var bundle_output = path.resolve(output_root, 'bundles');

module.exports = {
  entry: {
    polyfills: './src/polyfills.ts',
    main: './src/main.ts'
  },
  output: {
    filename: 'currencies_bula3_1992-[name].js',
    path: bundle_output,
    publicPath: '/assets/bundles/'
  },
  module: {
    rules: [{
      test: /\.tsx?$/,
      use: {
        loader: 'ts-loader'
      }
    }]
  },
  resolve: {
    modules: [
      path.resolve(__dirname, 'node_modules')
    ],
    extensions: ['.js', '.ts']
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
    })
  ]
};
