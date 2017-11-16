// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require dynamic_selectable
//= require_tree .

$(document).ready(function () {
  $('select[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable()
  $('#applicant_user_communication_address_attributes_extended_type').on('change', function () {

    if (this.value === 'rural') {
      $('#extended_urban_from').hide();
      $('#extended_rural_from').show();
    }
    if (this.value === 'urban') {
      $('#extended_urban_from').show();
      $('#extended_rural_from').hide();
    }
    //$('#extended-form').html("<%= j (render :partial => 'extended_rural') %>");
  });
});