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
    notice = "Role: #{@user.role}, Prev: #{@user.prev}"
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to :users, notice: "User #{@user.name} was successfully created."
    else
      render action: "add"
    end
  end

  def delete
    @user = User.find params[:id]
    name = @user.name
    @user.destroy
    redirect_to :users, notice: "User #{name} deleted."
  end

  def showall
    @users = User.all
    @user = User.new # For create user modal
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    if cannot? :update, User
      redirect_to(:users, notice: 'Permission denied!')
      return
    end
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :user, notice: 'User was successfully updated.' 
    else
      render action: "edit"
    end
  end
end
