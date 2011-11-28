class FridgeFoodsController < ApplicationController
  require 'time' 
  def kill
   @fridge_foods = FridgeFood.delete_all()
   redirect_to :controller => "fridge_foods"  
  end
  
  def push
    @log = Log.create(:user_id => params[:uid], :action => 'push') 
    exp = Time.parse("#{params[:day]}/#{params[:month]}/#{params[:year]}")
    puts exp
    @fridge_food = FridgeFood.create([:desc => params[:desc], :expiration => exp, :user => User.find(params[:uid])])
    redirect_to @fridge_food
  end

  def getfoods
    @fridge_foods = FridgeFood.find_all_by_user_id(params[:uid])

    logger.debug @fridge_food
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  # { render :xml => @fridge_foods }
    end
  end

  # GET /fridge_foods
  # GET /fridge_foods.xml
  def index
    @fridge_foods = FridgeFood.find_all_by_user_id(session[:user_id])

    logger.debug @fridge_food
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  # { render :xml => @fridge_foods }
    end
  end

  # GET /fridge_foods/1
  # GET /fridge_foods/1.xml
  def show
    @fridge_food = FridgeFood.find(params[:id])
    state = ""
    if ((@fridge_food.expiration - Date.current()).floor > 3)
      state = "good"
    elsif ((@fridge_food.expiration - Date.current()).floor < 0)
      state = "expired"
    else 
      state = "near"
    end

    respond_to do |format|
      format.html { render :inline => @fridge_food.id.to_s + " " + state }
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
    @log = Log.create(:user_id => params[:uid], :action => 'update') 
    @fridge_food = FridgeFood.find(params[:id])

    exp = Time.parse("#{params[:day]}/#{params[:month]}/#{params[:year]}")
    
    @fridge_food.update_attributes(:desc => params[:desc], :expiration => exp)
    @fridge_food.save! 
    
    redirect_to @fridge_food  
    #respond_to do |format|
    #  format.html { render :inline => "" + state }
    #  format.xml  { render :xml => @fridge_food }
    #end
  end

  def eat 
    @fridge_food = FridgeFood.find(params[:id])
    @log = Log.create(:user_id => params[:uid], :action => 'eat') 
    @fridge_food.destroy
    redirect_to :controller => "fridge_foods"  
  end

  def throw
    @fridge_food = FridgeFood.find(params[:id])
    @log = Log.create(:user_id => params[:uid], :action => 'throw') 
    @fridge_food.destroy
    redirect_to :controller => "fridge_foods"  
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
