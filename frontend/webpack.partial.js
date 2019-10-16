const path = require('path');
const webpack = require("webpack");
var CleanWebpackPlugin = require('clean-webpack-plugin');
const output_root = path.resolve(__dirname, '..', 'app', 'assets', 'javascripts');
const bundle_output = path.resolve(output_root, 'bundles');

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
  plugins: [
    new webpack.DefinePlugin({
      "VERSION": JSON.stringify("1.0")
    }),
    new CleanWebpackPlugin(['bundles'], {
      root: output_root,
      verbose: true
    }),
  ]
}
