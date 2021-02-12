class WareHousesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @ware_houses = current_user.ware_houses.all
  end
   

   
  def show
    @ware_house = current_user.ware_houses.find(params[:id])
  end
   

   
  def new
    @ware_house = WareHouse.new
    
  end
   

   
  def create
    @ware_house = WareHouse.new(ware_house_params)
    @ware_house.user = current_user
    if @ware_house.save
      redirect_to @ware_house
    else
      render :new
    end
  end
   

   
  def edit
    @ware_house = current_user.ware_houses.find(params[:id])
  end
   

   
  def update
    @ware_house = current_user.ware_houses.find(params[:id])
    if @ware_house.update(ware_house_params)
      redirect_to ware_house_path(@ware_house) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @ware_house = current_user.ware_houses.find(params[:id])
    @ware_house.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def ware_house_params
      params.require(:ware_house).permit( :ware_date, :desc, :name)
    end
  
  
  
end

