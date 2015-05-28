class API::OrderDetailBinsController < ApplicationController
  # GET /order_detail_bins
  # GET /order_detail_bins.json
  def index
    @order_detail_bins = OrderDetailBin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_detail_bins }
    end
  end

  # GET /order_detail_bins/1
  # GET /order_detail_bins/1.json
  def show
    @order_detail_bin = OrderDetailBin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_detail_bin }
    end
  end

  # GET /order_detail_bins/new
  # GET /order_detail_bins/new.json
  def new
    @order_detail_bin = OrderDetailBin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_detail_bin }
    end
  end

  # GET /order_detail_bins/1/edit
  def edit
    @order_detail_bin = OrderDetailBin.find(params[:id])
  end

  # POST /order_detail_bins
  # POST /order_detail_bins.json
  def create
    @order_detail_bin = OrderDetailBin.new(params[:order_detail_bin])

    respond_to do |format|
      if @order_detail_bin.save
        format.html { redirect_to @order_detail_bin, notice: 'Order detail bin was successfully created.' }
        format.json { render json: @order_detail_bin, status: :created, location: @order_detail_bin }
      else
        format.html { render action: "new" }
        format.json { render json: @order_detail_bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_detail_bins/1
  # PUT /order_detail_bins/1.json
  def update
    @order_detail_bin = OrderDetailBin.find(params[:id])

    respond_to do |format|
      if @order_detail_bin.update_attributes(params[:order_detail_bin])
        format.html { redirect_to @order_detail_bin, notice: 'Order detail bin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_detail_bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_detail_bins/1
  # DELETE /order_detail_bins/1.json
  def destroy
    @order_detail_bin = OrderDetailBin.find(params[:id])
    @order_detail_bin.destroy

    respond_to do |format|
      format.html { redirect_to order_detail_bins_url }
      format.json { head :no_content }
    end
  end
end
