class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def add
  	@user = User.new
  end

  def create
    require 'digest/md5'
    userinfo = params[:user]
    userinfo[:password] = Digest::MD5.hexdigest(userinfo[:password])
    @user = User.new userinfo
    @message = @user.save
  end

  def delete
    @user = User.find params[:id]
    @user.destroy
    redirect_to :users
  end

  def showall
    @users = User.all
  end
end
