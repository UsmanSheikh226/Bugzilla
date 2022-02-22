class ProjectsController < ApplicationController

  before_action :authenticate_admin!

  
  def index
    @projects = Project.all
  end

  def show
    @projects = Project.find(params[:id])
  end

  def new
    @Projects = Project.new
  end

  def create
    @projects = Project.new(projects_params)
    if @projects.save
      redirect_to @projects
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @projects = Project.find(params[:id])
  end

  def update
    @projects = Project.find(params[:id])

    if @projects.update(projects_params)
      redirect_to @projects
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @projects = Project.find(params[:id])
    @projects.destroy

    redirect_to root_path, status: :see_other
  end

  
  private
    def projects_params
      params.require(:project).permit(:title, :body, :author)
    end


end
