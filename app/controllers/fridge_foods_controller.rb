class FridgeFoodsController < ApplicationController
  # GET /fridge_foods
  # GET /fridge_foods.xml
  def index
    @fridge_foods = FridgeFood.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fridge_foods }
    end
  end

  # GET /fridge_foods/1
  # GET /fridge_foods/1.xml
  def show
    @fridge_food = FridgeFood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fridge_food }
    end
  end

  # GET /fridge_foods/new
  # GET /fridge_foods/new.xml
  def new
    @fridge_food = FridgeFood.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fridge_food }
    end
  end

  # GET /fridge_foods/1/edit
  def edit
    @fridge_food = FridgeFood.find(params[:id])
  end

  # POST /fridge_foods
  # POST /fridge_foods.xml
  def create
    @fridge_food = FridgeFood.new(params[:fridge_food])

    respond_to do |format|
      if @fridge_food.save
        format.html { redirect_to(@fridge_food, :notice => 'Fridge food was successfully created.') }
        format.xml  { render :xml => @fridge_food, :status => :created, :location => @fridge_food }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fridge_food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fridge_foods/1
  # PUT /fridge_foods/1.xml
  def update
    @fridge_food = FridgeFood.find(params[:id])

    respond_to do |format|
      if @fridge_food.update_attributes(params[:fridge_food])
        format.html { redirect_to(@fridge_food, :notice => 'Fridge food was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fridge_food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fridge_foods/1
  # DELETE /fridge_foods/1.xml
  def destroy
    @fridge_food = FridgeFood.find(params[:id])
    @fridge_food.destroy

    respond_to do |format|
      format.html { redirect_to(fridge_foods_url) }
      format.xml  { head :ok }
    end
  end
end