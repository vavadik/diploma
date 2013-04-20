class GalleryController < ApplicationController

  def init
    @nav_current = :gallery
  end

  def showall
    @media = Media.paginate page: params[:page]
  end

  def add
    @types = {}
    Mediatype.all.each do |mt|
      @types[mt.name] = mt.id
    end
    @media = Media.new
  end

  def create
    @media = Media.new params[:media]
    @media.user = current_user
    if @media.save
      redirect_to :gallery, notice: "Content created!"
    else
      render action: "add"
    end
  end

  def show
    @media = Media.find params[:id]
    respond_to do |format|
      format.html
      
      format.json do
        ret = {media: @media, user: @media.user}
        render json: ret
      end
    end
  end
end
