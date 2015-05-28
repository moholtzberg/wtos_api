class API::OrderDetailStatusesController < ApplicationController
  # GET /order_detail_statuses
  # GET /order_detail_statuses.json
  def index
    @order_detail_statuses = OrderDetailStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_detail_statuses }
    end
  end

  # GET /order_detail_statuses/1
  # GET /order_detail_statuses/1.json
  def show
    @order_detail_status = OrderDetailStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_detail_status }
    end
  end

  # GET /order_detail_statuses/new
  # GET /order_detail_statuses/new.json
  def new
    @order_detail_status = OrderDetailStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_detail_status }
    end
  end

  # GET /order_detail_statuses/1/edit
  def edit
    @order_detail_status = OrderDetailStatus.find(params[:id])
  end

  # POST /order_detail_statuses
  # POST /order_detail_statuses.json
  def create
    @order_detail_status = OrderDetailStatus.new(params[:order_detail_status])

    respond_to do |format|
      if @order_detail_status.save
        format.html { redirect_to @order_detail_status, notice: 'Order detail status was successfully created.' }
        format.json { render json: @order_detail_status, status: :created, location: @order_detail_status }
      else
        format.html { render action: "new" }
        format.json { render json: @order_detail_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_detail_statuses/1
  # PUT /order_detail_statuses/1.json
  def update
    @order_detail_status = OrderDetailStatus.find(params[:id])

    respond_to do |format|
      if @order_detail_status.update_attributes(params[:order_detail_status])
        format.html { redirect_to @order_detail_status, notice: 'Order detail status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_detail_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_detail_statuses/1
  # DELETE /order_detail_statuses/1.json
  def destroy
    @order_detail_status = OrderDetailStatus.find(params[:id])
    @order_detail_status.destroy

    respond_to do |format|
      format.html { redirect_to order_detail_statuses_url }
      format.json { head :no_content }
    end
  end
end
