class CtgSecdsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @ctg_secds = CtgSecd.all
  end
   

   
  def show
    @ctg_secd = CtgSecd.find(params[:id])
  end
   

   
  def new
    @ctg_secd = CtgSecd.new
    
  end
   

   
  def create
    @ctg_secd = CtgSecd.new(ctg_secd_params)
    #@ctg_secd.user = current_user
    if @ctg_secd.save
      redirect_to @ctg_secd
    else
      render :new
    end
  end
   

   
  def edit
    @ctg_secd = CtgSecd.find(params[:id])
  end
   

   
  def update
    @ctg_secd = CtgSecd.find(params[:id])
    if @ctg_secd.update(ctg_secd_params)
      redirect_to ctg_secd_path(@ctg_secd) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @ctg_secd = CtgSecd.find(params[:id])
    @ctg_secd.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def ctg_secd_params
      params.require(:ctg_secd).permit( :name)
    end
  
  
  
end

