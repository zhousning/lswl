require 'json'
class OutputItemsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  before_filter :is_can_use?, :only => [:index]
  #load_and_authorize_resource

   
  def index
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @retrieval.selecting
    @output_items = @retrieval.output_items.all
    gon.retrieval = @retrieval.id.to_s
  end

  def current_stock
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @outputs = @retrieval.output_items
    unless @outputs.blank?
      mtrl_arr = []
      @outputs.each do |output|
        ctg_mtrl = output.stock.ctg_mtrl
        mtrl_arr << ctg_mtrl.id
      end
      @stocks = current_user.stocks.where('ctg_mtrl_id not in (?)', mtrl_arr)
    else
      @stocks = current_user.stocks
    end
  end

  def select_stock
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    stock_ids = params[:selections].split(",")
    unless stock_ids.empty?
      @stocks = Stock.find(stock_ids)
      @stocks.each do |stock|
        OutputItem.create(:retrieval => @retrieval, :stock => stock)
      end
    end
    redirect_to retrieval_output_items_path(@retrieval)
  end

  def output_item_create
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @outputs = @retrieval.output_items
    nums = params[:nums]
    objs = nums.split("$")
    begin
      OutputItem.transaction do
        objs.each do |obj|
          obj_arr = obj.split(",")
          id = obj_arr[0]
          count = obj_arr[1]
          output = @outputs.find(id)
          output.update_attributes!(:count => count)
        end
      end
    rescue
      flash[:warning] = "数据不合法"
      redirect_to retrieval_output_items_path(@retrieval)
      return
    end
    redirect_to retrieval_path(@retrieval)
  end
   
  def destroy
    @retrieval = current_user.retrievals.find(params[:retrieval_id])
    @output_items = @retrieval.output_items
    @output_item = @output_items.find(params[:id])
    @output_item.destroy
    @retrieval.selecting if @retrieval.output_items.blank?
    redirect_to :action => :index
  end

  #def show
  #  @retrieval = current_user.retrievals.find(params[:retrieval_id])
  #  @output_items = @retrieval.output_items.all
  #  @output_item = @output_items.find(params[:id])
  #end
  # 
  #def new
  #  @retrieval = current_user.retrievals.find(params[:retrieval_id])
  #  @output_item = OutputItem.new
  #end
  # 
  #def create
  #  @retrieval = current_user.retrievals.find(params[:retrieval_id])
  #  @output_item = OutputItem.new(output_item_params)
  #  @output_item.retrieval = @retrieval 
  #  if @output_item.save
  #    redirect_to retrieval_output_items_path(@retrieval, @output_item) 
  #  else
  #    render :new
  #  end
  #end
  # 

  # 
  #def edit
  #  @retrieval = current_user.retrievals.find(params[:retrieval_id])
  #  @output_items = @retrieval.output_items.all
  #  @output_item = @output_items.find(params[:id])
  #end
  # 

  # 
  #def update
  #  @retrieval = current_user.retrievals.find(params[:retrieval_id])
  #  @output_items = @retrieval.output_items.all
  #  @output_item = @output_items.find(params[:id])
  #  if @output_item.update(output_item_params)
  #    redirect_to retrieval_output_items_path(@retrieval, @output_item) 
  #  else
  #    render :edit
  #  end
  #end
   
   

  

  

  private
    def output_item_params
      params.require(:output_item).permit( :count)
    end
  
    def is_can_use?
      @retrieval = current_user.retrievals.find(params[:retrieval_id])
      unless @retrieval.state != Setting.retrievals.completed && @retrieval.state != Setting.retrievals.canceled 
        redirect_to retrievals_path 
      end
    end
  
  
end

