class ModelsController < ApplicationController
 # GET /orders
  # GET /orders.json
  def index
    @models = Model.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @models.to_json(
        :only =>[],
        :methods => [:dg_model_id, :model_make_id, :model_number, :model_description, :model_active, :dg_last_update]
        )}
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @model = Model.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @model = Model.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @model }
    end
  end

  # GET /orders/1/edit
  def edit
    @model = Model.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @model = Model.new(params[:model])

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: 'Model was successfully created.' }
        format.json { render json: @model, status: :created, location: @model }
      else
        format.html { render action: "new" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @model = Model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @model = Model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to model_url }
      format.json { head :no_content }
    end
  end
end
