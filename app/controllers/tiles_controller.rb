class TilesController < ApplicationController
  skip_before_filter :login_required, :only => :show
  caches_page :show
  session :off, :only => :show
  def index
    @tiles = Tile.paginate :page => params[:page]
  end
  def show
    @tile = Tile.find params[:id]
    respond_to do |format|
      format.html
      format.png
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to '/images/rails.png'
  end
  def new
    @tile = Tile.new
  end
  def create
    @tile = Tile.new params[:tile]
    if @tile.save
      redirect_to tiles_path
    else
      render :template => 'tiles/new'
    end
  end
  def edit
    @tile = Tile.find params[:id]
  end
  def update
    if @tile.save
      expire_page formatted_tile_path(@tile, :png)
      redirect_to tiles_path
    end
  end
  def destroy
    @tile = Tile.find params[:id]
    id = @tile.id
    if @tile.destroy
      expire_page formatted_tile_path(id, :png)
      redirect_to tiles_path
    end
  end
end
