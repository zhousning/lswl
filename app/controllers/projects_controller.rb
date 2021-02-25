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
    @project.state = Setting.projects.ongoing
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
   
  def outbound
    @project = Project.where(:user => current_user, :id => params[:id]).first
    @picks = @project.picks

    begin
      @retrieval = Retrieval.create!(:name => @project.name, :outdate => Time.now, :dept => @project.dept, :signer => current_user.name, :state => Setting.retrievals.selected, :user => current_user, :project => @project)

      @picks.each do |pick|
        @pick_items = pick.pick_items
        unless @pick_items.blank? 
          OutputItem.transaction do
            @pick_items.each do |item|
              @stock = item.stock
              count = item.count

              @output_item = OutputItem.where(:retrieval => @retrieval, :stock => @stock).first
              if @output_item
                @output_item.add_count(count)
              else
                @output_item = OutputItem.create!(:retrieval => @retrieval, :stock => @stock)
                @output_item.add_count(count)
              end
            end
          end
        end
      end
      @project.outbound
    rescue
      flash[:warning] = "生成失败，请稍后再试"
    end
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit( :name, :start, :end, :state)
    end
  
  
  
end

