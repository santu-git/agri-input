# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#form_a1_extended_address_type').on 'change', ->
    if @value == 'rural'
      $('#extended_urban_from').hide()
      $('#extended_rural_from').show()
    if @value == 'urban'
      $('#extended_urban_from').show()
      $('#extended_rural_from').hide()
    return
