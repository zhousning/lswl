class RetrievalsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  before_filter :is_can_use?, :only => [:completed, :canceled, :edit, :update]
  #load_and_authorize_resource

   
  def index
    @retrievals = current_user.retrievals.all
  end
   

   
  def show
    @retrieval = current_user.retrievals.find(params[:id])
    @output_items = @retrieval.output_items
    @retrieval.selected unless @output_items.blank?
  end
   

   
  def new
    @retrieval = Retrieval.new
    
    #@retrieval.output_items.build
  end
   

   
  def create
    @retrieval = Retrieval.new(retrieval_params)
    @retrieval.state = Setting.retrievals.opening
    @retrieval.user = current_user
    if @retrieval.save
      redirect_to edit_retrieval_path(@retrieval)
    else
      render :new
    end
  end
   

  def completed
    @retrieval = current_user.retrievals.find(params[:id])
    @output_items = @retrieval.output_items
    unless @output_items.blank? 
      begin
        Stock.transaction do
          @output_items.each do |item|
            stock = item.stock
            count = item.count
            stock.minus_count(count)
          end
        end
        @retrieval.complete
      rescue
        flash[:warning] = "库存不足，请检查库存"
      end
    end
    redirect_to retrieval_path(@retrieval)
  end
   
  def canceled
    @retrieval.cancel
    redirect_to retrieval_path(@retrieval)
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
   

   
  #def destroy
  #  @retrieval = current_user.retrievals.find(params[:id])
  #  @retrieval.destroy
  #  redirect_to :action => :index
  #end
   

  

  

  private
    def retrieval_params
      params.require(:retrieval).permit( :name, :outdate, :dept, :receiver , :sign, :signer)
    end
  
    def is_can_use?
      @retrieval = current_user.retrievals.find(params[:id])
      unless @retrieval.state != Setting.retrievals.completed && @retrieval.state != Setting.retrievals.canceled 
        redirect_to retrievals_path 
      end
    end
end

