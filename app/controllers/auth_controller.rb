class AuthController < ApplicationController
  def login
  end

  def logout
  end

  def register
  	@user = User.new
  end
end
