class NewsController < ApplicationController

  def init
    @nav_current = :news
  end

  def showall
    @news = Announce.all
  end

  def add
    if cannot? :create, Announce
      redirect_to :root, notice: 'You can\'t create news!'
      return
    end
    @news = Announce.new
  end

  def create
    if cannot? :create, Announce
      redirect_to :root, notice: 'You can\'t create news!'
      return
    end
    params[:announce]
    @announce = Announce.new params[:announce]
    @announce.user = current_user
    if @announce.save
      redirect_to :news, notice: "Announce created!"
    else
      render action: "add"
    end
  end

  def show
  end

  def edit
  end
end
