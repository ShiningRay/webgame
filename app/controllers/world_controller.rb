class WorldController < ApplicationController
  def index
    
  end

  def refresh
    @character = Character.find session[:character_id]
    redirect_to formatted_character_path(@character, :js)
  end

  def move
    @character = current_user.characters.find session[:character_id]
    params[:direction].split(' ').each do |direction|
      case direction
      when '0'
        @character.map_y -= 1 if @character.map_y > 0
      when '1'
        @character.map_x += 1 if @character.map_x < @character.map.width
      when '2'
        @character.map_y += 1 if @character.map_y < @character.map.height
      when '3'
        @character.map_x -= 1 if @character.map_x > 0
      end
    end
    @character.save
    render :json => {:id => @character.id, :x => @character.map_x, :y => @character.map_y }
  end
  
  def enter
    if request.post?
      @character = current_user.characters.find_by_id(params[:character_id])
      session[:character_id] = @character.id
      @character.update_attribute :map_id, 1 unless @character.map
      redirect_to :action => :index, :id => @character.map_id
    end
  end
end
