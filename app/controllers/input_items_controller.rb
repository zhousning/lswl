class InputItemsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @ware_house = current_user.ware_houses.find(params[:ware_house_id])
    @input_items = @ware_house.input_items.all
  end
   

   
  def show
    @ware_house = current_user.ware_houses.find(params[:ware_house_id])
    @input_item = @ware_house.input_items.find(params[:id])
  end
   

   
  def new
    @ware_house = current_user.ware_houses.find(params[:ware_house_id])
    @input_item = InputItem.new
  end
   

   
  def create
    @ware_house = current_user.ware_houses.find(params[:ware_house_id])
    @input_item = InputItem.new(input_item_params)
    @input_item.ware_house = @ware_house
    if @input_item.save
      redirect_to ware_house_input_items_path(@ware_house)
    else
      render :new
    end
  end
   

   
  def edit
    @ware_house = current_user.ware_houses.find(params[:ware_house_id])
    @input_item = @ware_house.input_items.find(params[:id])
  end
   

   
  def update
    @ware_house = current_user.ware_houses.find(params[:ware_house_id])
    @input_item = @ware_house.input_items.find(params[:id])
    if @input_item.update(input_item_params)
      redirect_to input_item_path(@input_item) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @ware_house = current_user.ware_houses.find(params[:ware_house_id])
    @input_item = @ware_house.input_items.find(params[:id])
    @input_item.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def input_item_params
      params.require(:input_item).permit( :unit_price, :count, :total_price)
    end
  
  
  
end

