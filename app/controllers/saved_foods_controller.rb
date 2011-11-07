class SavedFoodsController < ApplicationController
  
  def push
   @saved_food = SavedFood.create([:desc => params[:desc], :offset => params[:offset], :user => User.find(params[:uid])])
   redirect_to :controller => "saved_foods"  
  end
  
  # GET /saved_foods
  # GET /saved_foods.xml
  def index
    @saved_foods = SavedFood.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @saved_foods }
    end
  end

  # GET /saved_foods/1
  # GET /saved_foods/1.xml
  def show
    @saved_food = SavedFood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @saved_food }
    end
  end

  # GET /saved_foods/new
  # GET /saved_foods/new.xml
  def new
    @saved_food = SavedFood.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @saved_food }
    end
  end

  # GET /saved_foods/1/edit
  def edit
    @saved_food = SavedFood.find(params[:id])
  end

  # POST /saved_foods
  # POST /saved_foods.xml
  def create
    @saved_food = SavedFood.new(params[:saved_food])

    respond_to do |format|
      if @saved_food.save
        format.html { redirect_to(@saved_food, :notice => 'Saved food was successfully created.') }
        format.xml  { render :xml => @saved_food, :status => :created, :location => @saved_food }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @saved_food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /saved_foods/1
  # PUT /saved_foods/1.xml
  def update
    @saved_food = SavedFood.find(params[:id])

    respond_to do |format|
      if @saved_food.update_attributes(params[:saved_food])
        format.html { redirect_to(@saved_food, :notice => 'Saved food was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @saved_food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_foods/1
  # DELETE /saved_foods/1.xml
  def destroy
    @saved_food = SavedFood.find(params[:id])
    @saved_food.destroy

    respond_to do |format|
      format.html { redirect_to(saved_foods_url) }
      format.xml  { head :ok }
    end
  end
end
