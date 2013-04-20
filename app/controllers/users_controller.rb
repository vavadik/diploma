class UsersController < ApplicationController

  def init
    @nav_current = :users
    @leftside_links = [
      {
        header: true,
        text: 'Users!'
      },
      {
        text: 'LinkFromUsers',
        name: :users,
        link: '#',
      },
    ]
  end

  def show
    @user = User.find params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def add
    if cannot? :create, User
      redirect_to :root, notice: 'Permission denied!'
      return
    end
  	@user = User.new
  end

  def create
    if cannot?(:create, User) && current_user
      redirect_to :root, notice: 'Permission denied!'
      return
    end
    @user = User.new params[:user]
    @user.prev = 1 if @user.prev == 0
    if @user.save
      redirect_to :users, notice: "User #{@user.name} registered!"
    else
      render action: "add"
    end
  end

  def delete
    if cannot? :destroy, User
      redirect_to :back, notice: 'You can\'t delete users!'
      return
    end
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
    @leftside_current = :my_acc if @user == current_user
    if cannot? :update, @user
      redirect_to(:users, notice: 'Permission denied!')
      return
    end
  end

  def update
    @user = User.find(params[:id])
    if cannot? :update, @user
      redirect_to(:users, notice: 'Permission denied!')
      return
    end
    if @user.update_attributes(params[:user])
      redirect_to :user, notice: 'User was successfully updated.' 
    else
      render action: "edit"
    end
  end
end
