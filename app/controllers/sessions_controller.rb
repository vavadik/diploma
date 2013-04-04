class SessionsController < ApplicationController
	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to :back, :notice => "Logged in as #{user.name}(#{user.role})"
	  else
	    redirect_to :back, :notice => "Login failed!"
	  end
	end

	def destroy
		layout nil
	  session[:user_id] = nil
	  redirect_to :back, :notice => "Logged out!"
	end
end
