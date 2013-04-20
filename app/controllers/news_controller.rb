class NewsController < ApplicationController

  def init
    @nav_current = :news
    @leftside_links = [
      {
        header: true,
        text: 'News'
      }
    ]
    @leftside_links << {text: 'Add announce', name: :add_announce, link: :news_add} if can? :create, Announce
  end

  def showall
    @news = Announce.all order: 'created_at DESC'
  end

  def add
    if cannot? :create, Announce
      redirect_to :root, notice: 'You can\'t create news!'
      return
    end
    @leftside_current = :add_announce
    @news = Announce.new
  end

  def create
    if cannot? :create, Announce
      redirect_to :root, notice: 'You can\'t create news!'
      return
    end
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
