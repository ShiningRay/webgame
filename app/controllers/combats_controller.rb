class CombatsController < ApplicationController
  # GET /combats
  # GET /combats.xml
  def index
    @combats = Combat.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @combats }
    end
  end

  # GET /combats/1
  # GET /combats/1.xml
  def show
    @combat = Combat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @combat }
    end
  end

  # GET /combats/new
  # GET /combats/new.xml
  def new
    @combat = Combat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @combat }
    end
  end

  # GET /combats/1/edit
  def edit
    @combat = Combat.find(params[:id])
  end

  # POST /combats
  # POST /combats.xml
  def create
    @combat = Combat.new(params[:combat])

    respond_to do |format|
      if @combat.save
        flash[:notice] = 'Combat was successfully created.'
        format.html { redirect_to(@combat) }
        format.xml  { render :xml => @combat, :status => :created, :location => @combat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @combat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /combats/1
  # PUT /combats/1.xml
  def update
    @combat = Combat.find(params[:id])

    respond_to do |format|
      if @combat.update_attributes(params[:combat])
        flash[:notice] = 'Combat was successfully updated.'
        format.html { redirect_to(@combat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @combat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /combats/1
  # DELETE /combats/1.xml
  def destroy
    @combat = Combat.find(params[:id])
    @combat.destroy

    respond_to do |format|
      format.html { redirect_to(combats_url) }
      format.xml  { head :ok }
    end
  end
end
