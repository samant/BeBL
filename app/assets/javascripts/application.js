// Loads all Bootstrap javascripts
// ...
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require highcharts
//= require cocoon
//= require_tree .

$(document).ready(function() {
  $('#dashboard_tab a:first').tab('show');
});