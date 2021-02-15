class RetrievalsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @retrievals = current_user.retrievals.all
  end
   

   
  def show
    @retrieval = current_user.retrievals.find(params[:id])
  end
   

   
  def new
    @retrieval = Retrieval.new
    
    @retrieval.output_items.build
  end
   

   
  def create
    @retrieval = Retrieval.new(retrieval_params)
    @retrieval.user = current_user
    if @retrieval.save
      redirect_to @retrieval
    else
      render :new
    end
  end
   

   
  def edit
    @retrieval = current_user.retrievals.find(params[:id])
  end
   

   
  def update
    @retrieval = current_user.retrievals.find(params[:id])
    if @retrieval.update(retrieval_params)
      redirect_to retrieval_path(@retrieval) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @retrieval = current_user.retrievals.find(params[:id])
    @retrieval.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def retrieval_params
      params.require(:retrieval).permit( :name, :outdate, :dept, :receiver , :sign, output_items_attributes: output_item_params)
    end
  
    def output_item_params
      [:id, :count ,:_destroy]
    end
  
end

