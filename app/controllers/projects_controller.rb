class ProjectsController < ApplicationController

  before_action :authenticate_user!


  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @user = User.new
    @bugs = Bug.all
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(projects_params.merge(user_id: current_user.id))
   # authorize @project
    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    authorize @project

    if @project.update(projects_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path, status: :see_other
  end

  
  private
    def projects_params
      params.require(:project).permit(:title, :body, :author, :status, :user_ids)
    end


end
