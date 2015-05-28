class API::OrderDetailsController < ApplicationController
  # GET /order_datails
  # GET /order_datails.json
  def index
    # equipment = Equipment.find(params[:equipment_id])
    # @order_datails = equipment.order_details
    if params[:equipment_id]
      @order_detail = OrderDetail.find(["EquipmentID >= ?", params[:equipment_id]])
    elsif params[:order_id]
      @order_detail = OrderDetail.find(["OrderID >= ?", params[:order_id]])
    end
    respond_to do |format|
      format.json { render json: @order_datail }
    end
  end

  # GET /order_datails/1
  # GET /order_datails/1.json
  def show
    @order_datail = OrderDatail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_datail }
    end
  end

  # GET /order_datails/new
  # GET /order_datails/new.json
  def new
    @order_datail = OrderDatail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_datail }
    end
  end

  # GET /order_datails/1/edit
  def edit
    @order_datail = OrderDatail.find(params[:id])
  end

  # POST /order_datails
  # POST /order_datails.json
  def create
    @order_datail = OrderDatail.new(params[:order_datail])

    respond_to do |format|
      if @order_datail.save
        format.html { redirect_to @order_datail, notice: 'Order datail was successfully created.' }
        format.json { render json: @order_datail, status: :created, location: @order_datail }
      else
        format.html { render action: "new" }
        format.json { render json: @order_datail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_datails/1
  # PUT /order_datails/1.json
  def update
    @order_datail = OrderDatail.find(params[:id])

    respond_to do |format|
      if @order_datail.update_attributes(params[:order_datail])
        format.html { redirect_to @order_datail, notice: 'Order datail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_datail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_datails/1
  # DELETE /order_datails/1.json
  def destroy
    @order_datail = OrderDatail.find(params[:id])
    @order_datail.destroy

    respond_to do |format|
      format.html { redirect_to order_datails_url }
      format.json { head :no_content }
    end
  end
end
