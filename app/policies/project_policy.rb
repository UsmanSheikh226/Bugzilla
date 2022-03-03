class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end



    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  

  #def index?
   # user.manager? && project.user_id == user.id
 # end

  def show?
    (user.manager? && project.user_id == user.id) || (project.users.include? user)
  end

  def update?
   user.manager? && project.user_id == user.id
   # project.user == user || user.manager? && project.user_id == user_id
   # user.manager? 
  
    #&& project.user_id == user.id
  end

  

  def new?
    user.manager?
  end


  class Scope < Scope
    def resolve
      if @user.manager?
        scope.where(created_by: @user.id)
      elsif @user.qa? 
        scope.all
      elsif @user.developer?
        scope = @user.projects
      end	
    end
  end
end