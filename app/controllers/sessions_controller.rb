class SessionsController < ApplicationController
	def create
		if current_user
			redirect_to :root, notice: 'You are already logged in!'
			return
		end
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to :back, :notice => "Logged in as #{user.name}(#{user.role})"
	  else
	    redirect_to :back, :notice => "Login failed!"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to :root, :notice => "Logged out!"
	end
end
