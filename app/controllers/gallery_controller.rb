class GalleryController < ApplicationController

  def init
    @nav_current = :gallery
    @leftside_links = [
      {
        header: true,
        text: 'Gallery'
      },
      {
        text: 'Add',
        name: :gallery_add,
        link: :gallery_add,
      },
      {
        text: 'Search',
        name: :gallery_search,
        link: :gallery_search,
      },
    ]
  end

  def showall
    if params[:user]
      user = User.find params[:user]
      @media = user.medias.paginate page: params[:page]
    else
      @media = Media.paginate page: params[:page]
    end
  end

  def add
    @leftside_current = :gallery_add
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
        ret = {media: @media, user: @media.user, own: can?(:destroy, @media)}
        render json: ret
      end
    end
  end

  def delete
    @media = Media.find params[:id]
    if cannot? :destroy, @media
      redirect_to :gallery, notice: "You can't delete this media!"
      return
    end
    name = @media.name
    @media.destroy
    redirect_to :gallery, notice: "#{name} removed!"
  end

  def search
    @leftside_current = :gallery_search
  end

  def find
    title = params[:title]
    tags = params[:tags]
    image = params[:image]

    @media = Media.where('name like ?', "%#{title}%")
    @skip_pagination = true
    render 'showall'
  end
end
