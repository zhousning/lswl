class WareHousesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  before_filter :is_can_use?, :only => [:completed, :canceled, :edit, :update]
  #load_and_authorize_resource

   
  def index
    @ware_houses = current_user.ware_houses.all
  end
   

   
  def show
    @ware_house = current_user.ware_houses.find(params[:id])
    @ware_house.uploaded
    @input_items = @ware_house.input_items
  end
   
   
  def new
    @ware_house = WareHouse.new
  end
   
  def create
    @ware_house = WareHouse.new(ware_house_params)
    @ware_house.state = Setting.ware_houses.opening
    @ware_house.user = current_user
    if @ware_house.save
      #redirect_to @ware_house
      redirect_to edit_ware_house_path(@ware_house)
    else
      render :new
    end
  end

  def completed
    @ware_house.complete
  end
   
  def canceled
    @ware_house.cancel
    redirect_to ware_house_path(@ware_house)
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
   
   
  #def destroy
  #  @ware_house = current_user.ware_houses.find(params[:id])
  #  @ware_house.destroy
  #  redirect_to :action => :index
  #end
   
  private
    def ware_house_params
      params.require(:ware_house).permit( :ware_date, :desc, :name, :sign)
    end
  
  
    def is_can_use?
      @ware_house = current_user.ware_houses.find(params[:id])
      unless @ware_house.state != Setting.ware_houses.completed && @ware_house.state != Setting.ware_houses.canceled 
        redirect_to ware_houses_path 
      end
    end

  
end

