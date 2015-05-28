class ItemUnitsController < ApplicationController
  # GET /item_units
  # GET /item_units.json
  def index
    @item_units = ItemUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_units }
    end
  end

  # GET /item_units/1
  # GET /item_units/1.json
  def show
    @item_unit = ItemUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_unit }
    end
  end

  # GET /item_units/new
  # GET /item_units/new.json
  def new
    @item_unit = ItemUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_unit }
    end
  end

  # GET /item_units/1/edit
  def edit
    @item_unit = ItemUnit.find(params[:id])
  end

  # POST /item_units
  # POST /item_units.json
  def create
    @item_unit = ItemUnit.new(params[:item_unit])

    respond_to do |format|
      if @item_unit.save
        format.html { redirect_to @item_unit, notice: 'Item unit was successfully created.' }
        format.json { render json: @item_unit, status: :created, location: @item_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @item_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_units/1
  # PUT /item_units/1.json
  def update
    @item_unit = ItemUnit.find(params[:id])

    respond_to do |format|
      if @item_unit.update_attributes(params[:item_unit])
        format.html { redirect_to @item_unit, notice: 'Item unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_units/1
  # DELETE /item_units/1.json
  def destroy
    @item_unit = ItemUnit.find(params[:id])
    @item_unit.destroy

    respond_to do |format|
      format.html { redirect_to item_units_url }
      format.json { head :no_content }
    end
  end
end
