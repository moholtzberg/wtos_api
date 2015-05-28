class SalesCodesController < ApplicationController
  # GET /sales_codes
  # GET /sales_codes.json
  def index
    @sales_codes = SalesCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_codes }
    end
  end

  # GET /sales_codes/1
  # GET /sales_codes/1.json
  def show
    @sales_code = SalesCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_code }
    end
  end

  # GET /sales_codes/new
  # GET /sales_codes/new.json
  def new
    @sales_code = SalesCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_code }
    end
  end

  # GET /sales_codes/1/edit
  def edit
    @sales_code = SalesCode.find(params[:id])
  end

  # POST /sales_codes
  # POST /sales_codes.json
  def create
    @sales_code = SalesCode.new(params[:sales_code])

    respond_to do |format|
      if @sales_code.save
        format.html { redirect_to @sales_code, notice: 'Sales code was successfully created.' }
        format.json { render json: @sales_code, status: :created, location: @sales_code }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_codes/1
  # PUT /sales_codes/1.json
  def update
    @sales_code = SalesCode.find(params[:id])

    respond_to do |format|
      if @sales_code.update_attributes(params[:sales_code])
        format.html { redirect_to @sales_code, notice: 'Sales code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_codes/1
  # DELETE /sales_codes/1.json
  def destroy
    @sales_code = SalesCode.find(params[:id])
    @sales_code.destroy

    respond_to do |format|
      format.html { redirect_to sales_codes_url }
      format.json { head :no_content }
    end
  end
end
