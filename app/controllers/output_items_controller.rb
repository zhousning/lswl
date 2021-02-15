class OutputItemsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_items = @retrieval.output_items.all
  end
   

   
  def show
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_items = @retrieval.output_items.all
    @output_item = @output_items.find(params[:id])
  end
   

   
  def new
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_item = OutputItem.new
  end
   

   
  def create
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_item = OutputItem.new(output_item_params)
    @output_item.retrieval = @retrieval 
    if @output_item.save
      redirect_to retrieval_output_items_path(@retrieval, @output_item) 
    else
      render :new
    end
  end
   

   
  def edit
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_items = @retrieval.output_items.all
    @output_item = @output_items.find(params[:id])
  end
   

   
  def update
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_items = @retrieval.output_items.all
    @output_item = @output_items.find(params[:id])
    if @output_item.update(output_item_params)
      redirect_to retrieval_output_items_path(@retrieval, @output_item) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_items = @retrieval.output_items.all
    @output_item = @output_items.find(params[:id])
    @output_item.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def output_item_params
      params.require(:output_item).permit( :count)
    end
  
  
  
end

