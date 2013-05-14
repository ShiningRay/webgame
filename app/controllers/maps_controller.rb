class MapsController < ApplicationController
  skip_before_filter :login_required, :only => :show
  caches_page :show
  session :off, :only => :show
  
  def index
    @maps = Map.all
  end

  def show
    @map = Map.find params[:id]
    respond_to do |format|
      format.html #{render :layout => false}
      format.xml
      format.js {render :json => @map}
    end
  end

  def new
    @map = Map.new :width=>10,:height=>10
    @map.matrix = (0...@map.height).to_a.collect{[0]*@map.width}
    render :template => 'maps/builder'
  end

  def edit
    @map = Map.find params[:id]
    render :template => 'maps/builder'
  end
  
  def update
    @map = Map.find params[:id]
    m = params[:matrix]
    m.each_pair do |r, row|
      row.each_pair do |c, col|
        @map.matrix[r.to_i][c.to_i]=col
      end
    end
    
    if @map.update_attributes params[:map]
      flash[:notice] = 'Successfully updated map'
      redirect_to maps_path
    end
  end
  def create
    @map = Map.new params[:map]
    m = params[:matrix]
    m.each_pair do |r, row|
      row.each_pair do |c, col|
        @map.matrix[r.to_i][c.to_i]=col
      end
    end
#    @map.matrix
    if @map.save
      redirect_to maps_path
    else
      render :template => 'maps/builder'
    end
  end
  def destroy
    @map = Map.find params[:id]
    if @map.destroy
      flash[:notice] = 'deleted'
      redirect_to maps_path
    end
  end
end
