'use strict';

// provide Bootstrap classes
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import '../node_modules/jquery/dist/jquery.min';
import '../node_modules/bootstrap/dist/js/bootstrap.min';

// own style
import './style.css';

import {Elm} from './Main.elm';

var app = Elm.Main.init({
    node: document.getElementById('app-container'),
    flags: {pageHeader: pageTitle}
});
