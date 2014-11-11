class ItemPricesController < ApplicationController
  # GET /item_prices
  # GET /item_prices.json
  def index
    @item_prices = ItemPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_prices }
    end
  end

  # GET /item_prices/1
  # GET /item_prices/1.json
  def show
    @item_price = ItemPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_price }
    end
  end

  # GET /item_prices/new
  # GET /item_prices/new.json
  def new
    @item_price = ItemPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_price }
    end
  end

  # GET /item_prices/1/edit
  def edit
    @item_price = ItemPrice.find(params[:id])
  end

  # POST /item_prices
  # POST /item_prices.json
  def create
    @item_price = ItemPrice.new(params[:item_price])

    respond_to do |format|
      if @item_price.save
        format.html { redirect_to @item_price, notice: 'Item price was successfully created.' }
        format.json { render json: @item_price, status: :created, location: @item_price }
      else
        format.html { render action: "new" }
        format.json { render json: @item_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_prices/1
  # PUT /item_prices/1.json
  def update
    @item_price = ItemPrice.find(params[:id])

    respond_to do |format|
      if @item_price.update_attributes(params[:item_price])
        format.html { redirect_to @item_price, notice: 'Item price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_prices/1
  # DELETE /item_prices/1.json
  def destroy
    @item_price = ItemPrice.find(params[:id])
    @item_price.destroy

    respond_to do |format|
      format.html { redirect_to item_prices_url }
      format.json { head :no_content }
    end
  end
end
