class ChatController < ApplicationController
	include ERB::Util
	def init
		if cannot? :use, Chat
			redirect_to :root, notice: 'Sign up to use chat!'
			return
		end
		@nav_current = :chat
	end

	def index
		
	end

	def showlast
		messages = Chat.all(limit: 5, order: 'id DESC').reverse
		if messages
			res = []
			messages.each do |mes|
				res << {text: mes.text, user: mes.user.name, id: mes.id}
			end
			respond_to do |wants|
				wants.json {render json: res}
			end
		end
	end

	def update
		from = params[:from].to_i
		messages = Chat.all conditions: "id > #{from}"
		if messages
			res = []
			messages.each do |mes|
				res << {text: mes.text, user: mes.user.name, id: mes.id}
			end
			respond_to do |wants|
				wants.json {render json: res}
			end
		end
	end

	def show
		message = Chat.find params[:id]
		if message
			respond_to do |wants|
				wants.json {render json: message}
			end
		end
	end

	def create

		message = Chat.new
		message.text = html_escape params[:text]
		message.user = current_user
		if message.save
			respond_to do |wants|
				ret = {}
				ret['text'] = message.text
				ret['user'] = message.user.name
				ret['id'] = message.id
				wants.json { render json: ret }
			end
		end
	end
end
