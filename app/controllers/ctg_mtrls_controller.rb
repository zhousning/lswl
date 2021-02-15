class CtgMtrlsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource
  #
  def list
    ctg_frsts = current_user.ctg_frsts
    @ctg_frst = ctg_frsts.first
    unless @ctg_frst.nil?
      @ctg_secd = @ctg_frst.ctg_secds.first 
      unless @ctg_secd.nil?
        redirect_to ctg_frst_ctg_secd_ctg_mtrls_path(@ctg_frst, @ctg_secd)
      end
    end
  end

  def index 
    gon.ctg_nodes = []
    ctg_frsts = current_user.ctg_frsts
    prepare_nodes(ctg_frsts, gon.ctg_nodes)

    @ctg_frst = ctg_frsts.find(params[:ctg_frst_id])
    if @ctg_frst
      @ctg_secd = @ctg_frst.ctg_secds.find(params[:ctg_secd_id])
      if @ctg_secd
        @ctg_mtrls = @ctg_secd.ctg_mtrls.all
      end
    end
  end

  def show
    ctg_frsts = current_user.ctg_frsts
    @ctg_frst = ctg_frsts.find(params[:ctg_frst_id])
    @ctg_secd = @ctg_frst.ctg_secds.find(params[:ctg_secd_id])
    @ctg_mtrl = @ctg_secd.ctg_mtrls.find(params[:id])
  end
   

   
  def new
    ctg_frsts = current_user.ctg_frsts
    @ctg_frst = ctg_frsts.find(params[:ctg_frst_id])
    @ctg_secd = @ctg_frst.ctg_secds.find(params[:ctg_secd_id])
    @ctg_mtrl = CtgMtrl.new
  end
   
  def create
    ctg_frsts = current_user.ctg_frsts
    @ctg_frst = ctg_frsts.find(params[:ctg_frst_id])
    @ctg_secd = @ctg_frst.ctg_secds.find(params[:ctg_secd_id])
    @ctg_mtrl = CtgMtrl.new(ctg_mtrl_params)
    @ctg_mtrl.ctg_secd = @ctg_secd
    if @ctg_mtrl.save
      redirect_to ctg_frst_ctg_secd_ctg_mtrls_path(@ctg_frst, @ctg_secd, @ctg_mtrl)
    else
      render :new
    end
  end
   

   
  def edit
    ctg_frsts = current_user.ctg_frsts
    @ctg_frst = ctg_frsts.find(params[:ctg_frst_id])
    @ctg_secd = @ctg_frst.ctg_secds.find(params[:ctg_secd_id])
    @ctg_mtrl = @ctg_secd.ctg_mtrls.find(params[:id])
  end
   

   
  def update
    ctg_frsts = current_user.ctg_frsts
    @ctg_frst = ctg_frsts.find(params[:ctg_frst_id])
    @ctg_secd = @ctg_frst.ctg_secds.find(params[:ctg_secd_id])
    @ctg_mtrl = @ctg_secd.ctg_mtrls.find(params[:id])
    if @ctg_mtrl.update(ctg_mtrl_params)
      redirect_to ctg_frst_ctg_secd_ctg_mtrls_path(@ctg_frst, @ctg_secd, @ctg_mtrl)
    else
      render :edit
    end
  end
   
  def destroy
    ctg_frsts = current_user.ctg_frsts
    @ctg_frst = ctg_frsts.find(params[:ctg_frst_id])
    @ctg_secd = @ctg_frst.ctg_secds.find(params[:ctg_secd_id])
    @ctg_mtrl = @ctg_secd.ctg_mtrls.find(params[:id])
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
  
    def prepare_nodes(ctg_frsts, nodes)
      ctg_frsts.each do |frst|
        frst_h = Hash.new
        frst_h['name'] = frst.name
        frst_h['drag'] = false 
        frst_h['open'] = true 

        secd_arr = []
        ctg_secds = frst.ctg_secds
        ctg_secds.each do |secd|
          secd_h = Hash.new
          secd_h['name'] = secd.name
          secd_h['drag'] = false 
          secd_h['open'] = true 
          secd_h['target'] = "_self"
          secd_h['url'] = ctg_frst_ctg_secd_ctg_mtrls_path(frst.id, secd.id)  
          secd_arr << secd_h 
        end
        frst_h['children'] = secd_arr
        nodes << frst_h 
      end
    end
   
  
  
end

