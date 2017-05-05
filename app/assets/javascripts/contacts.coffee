# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("._file_upload").change ->
    if this.value.length > 0
      $('._upload').addClass('blue')
      $('._upload').prop('disabled', false)
    else
      $('._upload').removeClass('blue')
      $('._upload').prop('disabled', true)