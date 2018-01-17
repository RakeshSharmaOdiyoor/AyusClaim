//= require bootstrap-transition
//= require bootstrap-alert
//= require bootstrap-modal
//= require bootstrap-dropdown
//= require bootstrap-scrollspy
//= require bootstrap-tab
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require bootstrap-button
//= require bootstrap-collapse
//= require bootstrap-carousel
//= require bootstrap-typeahead
//= require bootstrap-affix


jQuery(function() {
  $("a[rel=popover]").popover({html: true});
  $(".tooltip").tooltip();
  return $("a[rel=tooltip]").tooltip;
});

 