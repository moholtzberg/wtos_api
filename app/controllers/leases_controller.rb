class LeasesController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    time = DateTime.parse(params[:last_update]) || DateTime.new
    puts = "---->>>> #{time}"
    @leases = Lease.where(["LastUpdate >= ?", time])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leases.to_json(
        :only => [], 
        :methods => [:dg_lease_id, :lease_customer_id, :lease_number, :lease_term, :lease_start_date, :lease_payment, :dg_leasing_company_id,:dg_lease_last_updated_at])}
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @lease = Lease.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lease.to_json(
        :only => [], 
        :methods => [:dg_lease_id, :lease_customer_id, :lease_number, :lease_term, :lease_start_date, :lease_payment, :dg_leasing_company_id,:dg_lease_last_updated_at])}
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @lease = Lease.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lease }
    end
  end

  # GET /orders/1/edit
  def edit
    @lease = Lease.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @lease = Lease.new(params[:lease])

    respond_to do |format|
      if @lease.save
        format.html { redirect_to @lease, notice: 'Lease was successfully created.' }
        format.json { render json: @lease, status: :created, location: @lease }
      else
        format.html { render action: "new" }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @lease = Lease.find(params[:id])

    respond_to do |format|
      if @lease.update_attributes(params[:lease])
        format.html { redirect_to @lease, notice: 'Lease was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @lease = Lease.find(params[:id])
    @lease.destroy

    respond_to do |format|
      format.html { redirect_to leases_url }
      format.json { head :no_content }
    end
  end
end
