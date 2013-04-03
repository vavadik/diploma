# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> (
	$(".top-right").notify(
		message: {text: $(".top-right").attr('text')},
		type: 'blackgloss',
		fadeOut: { enabled: true, delay: 3000 }
	).show()
)