# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> (
	$(".userInfo").click -> (
		$.getJSON("/users/" + $(this).attr('user'), (data) -> (
			$("#userModal #modalHeader").html(data.name)
			$("#userModal #userMail").html(data.email)
			$("#userModal #userPassword").html(data.password)
			$("#userModal").modal('show')
		));
	)
	$("#addUserButton").click -> (
		$("#addUserModal").modal('show')
		$("#cancelButton").click -> (
			$("#addUserModal").modal('hide')
			return false;
		)
	)
)