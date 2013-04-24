# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
interval = (ms, func) -> setInterval func, ms

$(document).ready -> (
  input = $("#inputData")
  unless input.val() is undefined 
    image = $("#imageContainer img")
    mediaContainer = $("#imageContainer")
    videoFrame = $("#videoContainer iframe")
    videoContainer = $("#videoContainer")
    val = 'http://' + input.val().replace('http://', '').replace('https://', '')
    error = true
    interval 1000, ->
      val = 'http://' + input.val().replace('http://', '').replace('https://', '')
      if val.indexOf('http://youtube.com') != -1 || val.indexOf('http://www.youtube.com') != -1
        param = 'http://www.youtube.com/embed/' + val.split('v=')[1].split('&')[0]
        if videoFrame.attr('src') isnt param
          videoFrame.attr('src', param)
      else if val.indexOf('http://youtu.be/') != -1
        param = 'http://www.youtube.com/embed/' + val.split('http://youtu.be/')[1]
        if videoFrame.attr('src') isnt param
          videoFrame.attr('src', param)
      else
        image.attr 'src', '' if val is 'http://'
        if image.attr('src') isnt val
          image.attr "src", val

    videoFrame.load ->
      error = false
      $('#saveMediaButton').removeClass 'disabled'
      videoContainer.removeClass 'hidden'
      $('#noImageAlert').addClass 'hidden'

    image.error -> (
      error = true
      image.attr "src", ''
      $('#saveMediaButton').addClass 'disabled'
      mediaContainer.addClass 'hidden'
      $('#noImageAlert').removeClass 'hidden'
    )

    image.load -> 
      error = false
      $('#saveMediaButton').removeClass 'disabled'
      mediaContainer.removeClass 'hidden'
      $('#noImageAlert').addClass 'hidden'
  

  $('#saveMediaButton').click ->
    return !error

  $('.imgprev').click ->
    $.getJSON("/gallery/" + $(this).attr('media'), (data) ->
      $("#galleryModal #modalHeader").html data.media.name
      $("#galleryModal .modal-body img").attr 'src', data.media.data
      $("p#desc").html data.media.description
      $("p#username>b").html data.user.name
      $("p#postedAt>b").html data.media.created_at
      $("#galleryModal .modal-footer a").attr 'href', data.media.data
      $("#galleryModal").modal('show')
    )
)