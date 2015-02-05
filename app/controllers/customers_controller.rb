class CustomersController < ApplicationController
  
  def index
    time = DateTime.parse(params[:last_update]) || DateTime.new
    puts = "---->>>> #{time}"
    @customers = Customer.where(["LastUpdate >= ?", time])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers.to_json(:only => [], :methods => [:dg_customer_id, :dg_customer_number, :dg_sales_rep_id, :customer_name, :customer_address, :customer_city, :customer_state, :customer_zip, :customer_phone, :customer_fax, :customer_active, :customer_prospect, :dg_last_update]) }
    end
  end
  
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer.to_json(:only => [], :methods => [:dg_customer_id, :dg_customer_number, :dg_sales_rep_id, :customer_name, :customer_address, :customer_city, :customer_state, :customer_zip, :customer_phone, :customer_fax, :customer_active, :customer_prospect, :dg_last_update]) }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        # format.json { head :no_content }
        format.json { render json: @customer, status: :accepted, location: @customer }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
end
