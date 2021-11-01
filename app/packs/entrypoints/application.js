import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import M from 'materialize-css/dist/js/materialize';
import I18n from "i18n-js"

Rails.start();
Turbolinks.start();
ActiveStorage.start();
// Support component names relative to this directory:
var componentRequireContext = require.context("./components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

document.addEventListener("turbolinks:load", () => {
  let alerts = document.querySelectorAll("#alert")
  let notifications = document.querySelectorAll("#notice")
  if (alert) {
    alerts.forEach((alert) => {
      M.toast({html: alert.value})
    })
  }
  if (notifications) {
    notifications.forEach((notification) => {
      M.toast({html: notification.value})
    })
  }
})
