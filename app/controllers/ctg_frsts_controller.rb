class CtgFrstsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @ctg_frsts = current_user.ctg_frsts.all
  end
   

   
  def show
    @ctg_frst = current_user.ctg_frsts.find(params[:id])
  end
   

   
  def new
    @ctg_frst = CtgFrst.new
    
    @ctg_frst.ctg_secds.build
    
  end
   

   
  def create
    @ctg_frst = CtgFrst.new(ctg_frst_params)
    @ctg_frst.user = current_user
    if @ctg_frst.save
      redirect_to @ctg_frst
    else
      render :new
    end
  end
   

   
  def edit
    @ctg_frst = current_user.ctg_frsts.find(params[:id])
  end
   

   
  def update
    @ctg_frst = CtgFrst.find(params[:id])
    if @ctg_frst.update(ctg_frst_params)
      redirect_to ctg_frst_path(@ctg_frst) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @ctg_frst = current_user.ctg_frsts.find(params[:id])
    @ctg_frst.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def ctg_frst_params
      params.require(:ctg_frst).permit( :name, ctg_secds_attributes: ctg_secd_params)
    end
  
  
  
    def ctg_secd_params
      [:id, :name ,:_destroy]
    end
  
end

