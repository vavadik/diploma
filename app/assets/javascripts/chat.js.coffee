# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

interval = (ms, func) -> setInterval func, ms

$(document).ready ->
	chatWindow = $("#chatWindow")
	chatMessage = $("#chatMessage")
	sendButton = $("#chatSendButton")
	$.getJSON(
		"/chat/showlast",
		(data)->
			for mes in data
				chatWindow.append '<p id="' + mes.id + '"><b>' + mes.user + ':</b> ' + mes.text + '</p>'
		)
	sendButton.click ->
		$.ajaxSetup {
		  beforeSend: (xhr)->
		    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) # ajax save session
		}
		$.post(
			'/chat/create.json', {text: chatMessage.val()},
		).done (data)->
			#chatWindow.append '<p id="' + data.id + '"><b>' + data.user + ':</b> ' + data.text + '</p>'
			#chatWindow.scrollTop chatWindow[0].scrollHeight
			chatMessage.val ''
		return false
	lastId = 0
	interval 1000, ->
		lastId = $("div#chatWindow p").last().attr 'id'
		$.getJSON(
			"/chat/update/" + lastId + '.json',
			(data)->
				for mes in data
					chatWindow.append '<p id="' + mes.id + '"><b>' + mes.user + ':</b> ' + mes.text + '</p>'
				chatWindow.scrollTop chatWindow[0].scrollHeight
			)

