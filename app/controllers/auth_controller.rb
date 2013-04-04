class AuthController < ApplicationController
  def login
  end

  def logout
  end

  def register
    if cannot?(:create, User) && current_user != nil
      redirect_to :root, notice: 'Permission denied11!'
    end
  	@user = User.new
  end
end
