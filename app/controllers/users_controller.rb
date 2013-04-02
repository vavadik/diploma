class UsersController < ApplicationController

  before_filter :init

  def init
    @nav_current = :users
  end

  def show
    @user = User.find params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def add
  	@user = User.new
  end

  def create
    require 'digest/md5'
    userinfo = params[:user]
    userinfo[:password] = Digest::MD5.hexdigest(userinfo[:password])
    @user = User.new userinfo
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "add"
    end
  end

  def delete
    @user = User.find params[:id]
    @user.destroy
    redirect_to :users
  end

  def showall
    @users = User.all
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render action: "edit"
    end
  end
end
