class ShoppingListsController < ApplicationController
  def kill
   @shopping_lists = ShoppingList.delete_all("user_id = " + params[:uid])
   redirect_to :controller => "shopping_lists"  
  end

  def push
   @log = Log.create(:user_id => params[:uid], :action => 'add to shopping list') 
   @shopping_list = ShoppingList.create([:desc => params[:desc], :user => User.find(params[:uid])])
   redirect_to @shopping_list 
  end
  
  def getfoods
    @shopping_lists = ShoppingList.find_all_by_user_id(params[:uid])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shopping_lists }
    end
  end
  
  # GET /shopping_lists
  # GET /shopping_lists.xml
  def index
    @shopping_lists = ShoppingList.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @shopping_lists }
    end
  end

  # GET /shopping_lists/1
  # GET /shopping_lists/1.xml
  def show
    @shopping_list = ShoppingList.find(params[:id])

    respond_to do |format|
      format.html { render :inline => @shopping_list.id.to_s }
      format.xml  { render :xml => @shopping_list }
    end
  end

  # GET /shopping_lists/new
  # GET /shopping_lists/new.xml
  def new
    @shopping_list = ShoppingList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shopping_list }
    end
  end

  # GET /shopping_lists/1/edit
  def edit
    @shopping_list = ShoppingList.find(params[:id])
  end

  # POST /shopping_lists
  # POST /shopping_lists.xml
  def create
    @shopping_list = ShoppingList.new(params[:shopping_list])

    respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to(@shopping_list, :notice => 'Shopping list was successfully created.') }
        format.xml  { render :xml => @shopping_list, :status => :created, :location => @shopping_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shopping_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_lists/1
  # PUT /shopping_lists/1.xml
  def update
    @log = Log.create(:user_id => params[:uid], :action => 'update shopping list') 
    @shopping_list = ShoppingList.find(params[:id])

    respond_to do |format|
      if @shopping_list.update_attributes(params[:shopping_list])
        format.html { redirect_to(@shopping_list, :notice => 'Shopping list was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shopping_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1
  # DELETE /shopping_lists/1.xml
  def destroy
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.destroy

    respond_to do |format|
      format.html { redirect_to(shopping_lists_url) }
      format.xml  { head :ok }
    end
  end
end
