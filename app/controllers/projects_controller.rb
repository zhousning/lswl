class ProjectsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @projects = current_user.projects
  end
   

   

   
  def new
    @project = Project.new
    
  end
   

   
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end
   

   
  def edit
    @projects = current_user.projects
    @project = @projects.find(params[:id])
  end
   

   
  def update
    @projects = current_user.projects
    @project = @projects.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end
   
  def destroy
    @projects = current_user.projects
    @project = @projects.find(params[:id])
    @project.destroy
    redirect_to :action => :index
  end
   
  def completed
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @picks.each do |pick|
      @pick_items = pick.pick_items
      unless @pick_items.blank? 
        begin
          Stock.transaction do
            @pick_items.each do |item|
              stock = item.stock
              count = item.count
              stock.minus_count(count)
            end
          end
          @pick.complete
        rescue
          flash[:warning] = "库存不足，请检查库存"
        end
      end
    end
    redirect_to pick_path(@pick)
  end

  def canceled
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:id])
    @pick.cancel
    redirect_to pick_path(@pick)
  end
  

  private
    def project_params
      params.require(:project).permit( :name, :start, :end, :state)
    end
  
  
  
end

