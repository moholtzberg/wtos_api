class API::PriceLevelsController < ApplicationController
  # GET /price_levels
  # GET /price_levels.json
  def index
    @price_levels = PriceLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @price_levels }
    end
  end

  # GET /price_levels/1
  # GET /price_levels/1.json
  def show
    @price_level = PriceLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @price_level }
    end
  end

  # GET /price_levels/new
  # GET /price_levels/new.json
  def new
    @price_level = PriceLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @price_level }
    end
  end

  # GET /price_levels/1/edit
  def edit
    @price_level = PriceLevel.find(params[:id])
  end

  # POST /price_levels
  # POST /price_levels.json
  def create
    @price_level = PriceLevel.new(params[:price_level])

    respond_to do |format|
      if @price_level.save
        format.html { redirect_to @price_level, notice: 'Price level was successfully created.' }
        format.json { render json: @price_level, status: :created, location: @price_level }
      else
        format.html { render action: "new" }
        format.json { render json: @price_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /price_levels/1
  # PUT /price_levels/1.json
  def update
    @price_level = PriceLevel.find(params[:id])

    respond_to do |format|
      if @price_level.update_attributes(params[:price_level])
        format.html { redirect_to @price_level, notice: 'Price level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @price_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_levels/1
  # DELETE /price_levels/1.json
  def destroy
    @price_level = PriceLevel.find(params[:id])
    @price_level.destroy

    respond_to do |format|
      format.html { redirect_to price_levels_url }
      format.json { head :no_content }
    end
  end
end
