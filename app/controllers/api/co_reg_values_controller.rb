class API::CoRegValuesController < ApplicationController
  # GET /co_reg_values
  # GET /co_reg_values.json
  def index
    @co_reg_values = CoRegValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @co_reg_values }
    end
  end

  # GET /co_reg_values/1
  # GET /co_reg_values/1.json
  def show
    @co_reg_value = CoRegValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @co_reg_value }
    end
  end

  # GET /co_reg_values/new
  # GET /co_reg_values/new.json
  def new
    @co_reg_value = CoRegValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @co_reg_value }
    end
  end

  # GET /co_reg_values/1/edit
  def edit
    @co_reg_value = CoRegValue.find(params[:id])
  end

  # POST /co_reg_values
  # POST /co_reg_values.json
  def create
    @co_reg_value = CoRegValue.new(params[:co_reg_value])

    respond_to do |format|
      if @co_reg_value.save
        format.html { redirect_to @co_reg_value, notice: 'Co reg value was successfully created.' }
        format.json { render json: @co_reg_value, status: :created, location: @co_reg_value }
      else
        format.html { render action: "new" }
        format.json { render json: @co_reg_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /co_reg_values/1
  # PUT /co_reg_values/1.json
  def update
    @co_reg_value = CoRegValue.find(params[:id])

    respond_to do |format|
      if @co_reg_value.update_attributes(params[:co_reg_value])
        format.html { redirect_to @co_reg_value, notice: 'Co reg value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @co_reg_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /co_reg_values/1
  # DELETE /co_reg_values/1.json
  def destroy
    @co_reg_value = CoRegValue.find(params[:id])
    @co_reg_value.destroy

    respond_to do |format|
      format.html { redirect_to co_reg_values_url }
      format.json { head :no_content }
    end
  end
end
