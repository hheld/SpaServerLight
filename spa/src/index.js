'use strict';

// provide Bootstrap classes
require('../node_modules/bootstrap/dist/css/bootstrap.min.css')
require('../node_modules/jquery/src/jquery')
require('../node_modules/bootstrap/dist/js/bootstrap.min')

// own style
require('./style.css')

var Elm = require('./Main.elm');

var mountNode = document.getElementById('app-container');

var app = Elm.Main.embed(mountNode, {
    pageHeader: pageTitle
});
