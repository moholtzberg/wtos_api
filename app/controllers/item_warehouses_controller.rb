class ItemWarehousesController < ApplicationController
  # GET /item_warehouses
  # GET /item_warehouses.json
  def index
    @item_warehouses = ItemWarehouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_warehouses }
    end
  end

  # GET /item_warehouses/1
  # GET /item_warehouses/1.json
  def show
    @item_warehouse = ItemWarehouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_warehouse }
    end
  end

  # GET /item_warehouses/new
  # GET /item_warehouses/new.json
  def new
    @item_warehouse = ItemWarehouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_warehouse }
    end
  end

  # GET /item_warehouses/1/edit
  def edit
    @item_warehouse = ItemWarehouse.find(params[:id])
  end

  # POST /item_warehouses
  # POST /item_warehouses.json
  def create
    @item_warehouse = ItemWarehouse.new(params[:item_warehouse])

    respond_to do |format|
      if @item_warehouse.save
        format.html { redirect_to @item_warehouse, notice: 'Item warehouse was successfully created.' }
        format.json { render json: @item_warehouse, status: :created, location: @item_warehouse }
      else
        format.html { render action: "new" }
        format.json { render json: @item_warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_warehouses/1
  # PUT /item_warehouses/1.json
  def update
    @item_warehouse = ItemWarehouse.find(params[:id])

    respond_to do |format|
      if @item_warehouse.update_attributes(params[:item_warehouse])
        format.html { redirect_to @item_warehouse, notice: 'Item warehouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_warehouses/1
  # DELETE /item_warehouses/1.json
  def destroy
    @item_warehouse = ItemWarehouse.find(params[:id])
    @item_warehouse.destroy

    respond_to do |format|
      format.html { redirect_to item_warehouses_url }
      format.json { head :no_content }
    end
  end
end
