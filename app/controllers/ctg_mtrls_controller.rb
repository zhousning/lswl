class CtgMtrlsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @ctg_mtrls = CtgMtrl.all
  end
   

   
  def show
    @ctg_mtrl = CtgMtrl.find(params[:id])
  end
   

   
  def new
    @ctg_mtrl = CtgMtrl.new
    
  end
   
  def create
    @ctg_mtrl = CtgMtrl.new(ctg_mtrl_params)
    @secd = CtgSecd.find(params[:ctg_secd])
    @ctg_mtrl.ctg_secd = @secd
    #@ctg_mtrl.user = current_user
    if @ctg_mtrl.save
      redirect_to @ctg_mtrl
    else
      render :new
    end
  end
   

   
  def edit
    @ctg_mtrl = CtgMtrl.find(params[:id])
  end
   

   
  def update
    @ctg_mtrl = CtgMtrl.find(params[:id])
    if @ctg_mtrl.update(ctg_mtrl_params)
      redirect_to ctg_mtrl_path(@ctg_mtrl) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @ctg_mtrl = CtgMtrl.find(params[:id])
    @ctg_mtrl.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def ctg_mtrl_params
      params.require(:ctg_mtrl).permit( :idno, :name, :pet_name, :model_no , enclosures_attributes: enclosure_params)
    end
  
    def enclosure_params
      [:id, :file, :_destroy]
    end
  
  
  
end

