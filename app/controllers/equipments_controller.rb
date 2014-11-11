class EquipmentsController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    time = DateTime.parse(params[:last_update])
    puts = "---->>>> #{time}"
    @equipments = Equipment.where(["LastUpdate >= ?", time])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @equipments.to_json(
        :only => [], 
        :methods => [:dg_equipment_id, :dg_customer_id, :equipment_number, :equipment_serial, :equipment_model_id,  :equipment_lease_id, :equipment_install_date, :dg_last_update])}
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @equipment = Equipment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equipment }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @equipment = Equipment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equipment }
    end
  end

  # GET /orders/1/edit
  def edit
    @equipment = Equipment.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @equipment = Equipment.new(params[:equipment])

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
        format.json { render json: @equipment, status: :created, location: @equipment }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      if @equipment.update_attributes(params[:equipment])
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to equipments_url }
      format.json { head :no_content }
    end
  end
end
