class SessionsController < ApplicationController
	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to :root, :notice => "Logged in as #{user.name}"
	  else
	    redirect_to :root, :notice => "Login failed!"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to :root, :notice => "Logged out!"
	end
end
