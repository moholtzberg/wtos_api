class MakesController < ApplicationController
  
  def index
    time = DateTime.parse(params[:last_update]) || DateTime.new
    puts = "---->>>> #{time}"
    @makes = Make.where(["LastUpdate >= ?", time])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @makes.to_json(
        :only => [], :methods => [:dg_make_id, :make_name, :make_active, :dg_last_update])}
    end
  end

  def show
    @make = Make.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @make }
    end
  end

  def new
    @make = Make.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @make }
    end
  end

  def edit
    @make = Make.find(params[:id])
  end

  def create
    @make = Make.new(params[:make])

    respond_to do |format|
      if @make.save
        format.html { redirect_to @make, notice: 'Make was successfully created.' }
        format.json { render json: @make, status: :created, location: @make }
      else
        format.html { render action: "new" }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @make = Make.find(params[:id])

    respond_to do |format|
      if @make.update_attributes(params[:make])
        format.html { redirect_to @make, notice: 'Make was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @make = Make.find(params[:id])
    @make.destroy

    respond_to do |format|
      format.html { redirect_to makes_url }
      format.json { head :no_content }
    end
  end
end
