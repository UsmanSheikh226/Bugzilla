class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end
  def show
    @bug = Bug.find(params[:id])
  end
  def new
    @bug = Bug.new
  end
  def create
    @bug = Bug.new(projects_params)
  
    if @bug.save
      redirect_to @bug
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def projects_params
    params.require(:bug).permit(:title, :description, :assigned)
  end

end
