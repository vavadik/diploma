# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
interval = (ms, func) -> setInterval func, ms

$(document).ready -> (
  input = $("#inputData")
  unless input.val() is undefined 
    image = $("#imagePrev img")
    imageContainer = $("#imagePrev div.thumbnail")
    val = 'http://' + input.val().replace('http://', '').replace('https://', '')
    error = true
    interval 1000, ->
      val = 'http://' + input.val().replace('http://', '').replace('https://', '')
      image.attr 'src', '' if val is 'http://'
      if image.attr('src') isnt val
        image.attr "src", val

    image.error -> (
      error = true
      image.attr "src", ''
      $('#saveMediaButton').addClass 'disabled'
      imageContainer.addClass 'hidden'
      $('#noImageAlert').removeClass 'hidden'
    )

    image.load -> 
      error = false
      $('#saveMediaButton').removeClass 'disabled'
      imageContainer.removeClass 'hidden'
      $('#noImageAlert').addClass 'hidden'
  

  $('#saveMediaButton').click ->
    return !error

  $('.imgprev').click ->
    $.getJSON("/gallery/" + $(this).attr('media'), (data) ->
      $("#galleryModal .modal-header").html data.name
      $("#galleryModal .modal-body img").attr 'src', data.data
      $("p#desc").html data.description
      $("#galleryModal .modal-footer a").attr 'href', data.data
      $("#galleryModal").modal('show')
    )
)