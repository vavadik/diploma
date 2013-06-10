class AuthController < ApplicationController
  def login
    redirect_to :root, notice: "Logged in as #{current_user.name}" if current_user
  end

  def logout
  end

  def register
    if cannot?(:create, User) && current_user
      redirect_to :root, notice: 'Permission denied!'
      return
    end
  	@user = User.new
  end
end
