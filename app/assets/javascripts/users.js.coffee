# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> (
	$(".userInfo").click (e) -> (
		$.getJSON("/users/" + $(this).attr('user'), (data) -> (
			if $(e.target).prop('tagName') != 'A' && $(e.target).prop('tagName') != 'I'
				$("#userModal #modalHeader").html(data.name)
				$("#userModal #userMail").html(data.email)
				$("#userModal #userPassword").html(data.password_digest)
				$("#userModal").modal('show')
		));
	)
)