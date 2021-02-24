class PickItemsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick.selecting
    @pick_items = @pick.pick_items
    gon.project = @project.id
    gon.pick = @pick.id
  end
   
  def current_stock
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_items = @pick.pick_items
    unless @pick_items.blank?
      mtrl_arr = []
      @pick_items.each do |pick_item|
        ctg_mtrl = pick_item.stock.ctg_mtrl
        mtrl_arr << ctg_mtrl.id
      end
      @stocks = current_user.stocks.where('ctg_mtrl_id not in (?)', mtrl_arr)
    else
      @stocks = current_user.stocks
    end
  end

  def select_stock
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    stock_ids = params[:selections].split(",")
    unless stock_ids.empty?
      @stocks = Stock.find(stock_ids)
      @stocks.each do |stock|
        PickItem.create(:pick => @pick, :stock => stock)
      end
    end
    redirect_to project_pick_pick_items_path(@project, @pick)
  end

  def pick_item_create
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_items = @pick.pick_items
    nums = params[:nums]
    objs = nums.split("$")
    begin
      PickItem.transaction do
        objs.each do |obj|
          obj_arr = obj.split(",")
          id = obj_arr[0]
          count = obj_arr[1]
          pick_item = @pick_items.find(id)
          pick_item.add_count(count)
        end
      end
    rescue
      flash[:warning] = "数据不合法"
      redirect_to project_pick_pick_items_path(@project, @pick)
      return
    end
    redirect_to project_pick_path(@project, @pick)
  end
   

   
  def show
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_items = @pick.pick_items
    @pick_item = @pick_items.find(params[:id])
  end
   

   
  def new
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_item = PickItem.new
  end
   

   
  def create
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_item = PickItem.new(pick_item_params)
    @pick_item.pick = @pick 
    if @pick_item.save
      redirect_to project_pick_pick_items_path(@project, @pick)
    else
      render :new
    end
  end
   

   
  def edit
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_items = @pick.pick_items
    @pick_item = @pick_items.find(params[:id])
  end
   

   
  def update
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_items = @pick.pick_items
    @pick_item = @pick_items.find(params[:id])
    if @pick_item.update(pick_item_params)
      redirect_to project_pick_pick_items_path(@project, @pick)
    else
      render :edit
    end
  end
   

   
  def destroy
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:pick_id])
    @pick_items = @pick.pick_items
    @pick_item = @pick_items.find(params[:id])
    @pick_item.destroy
    redirect_to project_pick_pick_items_path(@project, @pick)
  end
   

  

  

  private
    def pick_item_params
      params.require(:pick_item).permit( :count)
    end
  
  
  
end

