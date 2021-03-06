var path = require('path');
var webpack = require('webpack');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var ElmMinify = require('elm-minify');
const TerserPlugin = require('terser-webpack-plugin');

module.exports = {
  entry: {app: ['./src/index.js']},

  output: {
    path: path.resolve(__dirname + '/../dist'),
    filename: '[name].js',
  },

  module: {
    rules: [
      {
        test: /\.(css|scss)$/,
        use: [
          'style-loader',
          'css-loader',
        ]
      },
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file?name=[name].[ext]',
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack-loader' +
            (process.env.NODE_ENV === 'debug' ? '?debug=true' : ''),
        options: (process.env.NODE_ENV === 'debug' ? {} : {optimize: true}),
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader?limit=10000&mimetype=application/font-woff',
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader',
      },
    ],

    noParse: /\.elm$/,
  },

  plugins: [
    new webpack.DefinePlugin({'pageTitle': '"App page header goes here!"'}),

    new HtmlWebpackPlugin(
        {title: 'App name goes here!!', template: 'src/index.ejs'}),
  ],

  optimization:
      {minimizer: [new TerserPlugin({terserOptions: ElmMinify.terserConfig})]},
};
