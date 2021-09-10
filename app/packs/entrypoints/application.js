import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import 'materialize-css/dist/js/materialize';
import I18n from "i18n-js"
//= require i18n

Rails.start();
Turbolinks.start();
ActiveStorage.start();
// Support component names relative to this directory:
var componentRequireContext = require.context("./components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
