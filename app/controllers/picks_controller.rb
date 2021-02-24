class PicksController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #before_filter :is_can_use?, :only => [:completed, :canceled, :edit, :update]
  #load_and_authorize_resource

   
  def index
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
  end
   

   
  def show
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:id])
    @pick_items = @pick.pick_items
    @pick.selected unless @pick_items.blank?
  end
   

   
  def new
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @pick = Pick.new
  end
   
  def create
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @pick = Pick.new(pick_params)
    @pick.state = Setting.picks.opening
    @pick.project = @project 
    if @pick.save
      redirect_to edit_project_pick_path(@project, @pick) 
    else
      render :new
    end
  end
   
  def completed
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:id])
    @pick.complete
    redirect_to project_pick_path(@project, @pick)
  end

  def canceled
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:id])
    @pick.cancel
    redirect_to project_pick_path(@project, @pick)
  end
   
  def edit
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:id])
  end
   

   
  def update
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:id])
    if @pick.update(pick_params)
      redirect_to project_picks_path(@project) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @projects = current_user.projects
    @project = @projects.find(params[:project_id])
    @picks = @project.picks
    @pick = @picks.find(params[:id])
    @pick.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def pick_params
      params.require(:pick).permit( :name, :pick_date, :signer, :dept, :receiver, :state, :desc , :attch)
    end
  
    def is_can_use?
      @retrieval = current_user.retrievals.find(params[:id])
      unless @retrieval.state != Setting.retrievals.completed && @retrieval.state != Setting.retrievals.canceled 
        redirect_to retrievals_path 
      end
    end
  
  
end

