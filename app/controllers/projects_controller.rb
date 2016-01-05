class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :project_owner]
  
  before_action :project_owner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @projects = Project.where(user_id: current_user)
    @user = current_user
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    def set_project
      @project = Project.find(params[:id])

      if @project.id == nil
        redirect_to root_path
      end
    end

    def project_params
      params.require(:project).permit(:title)
    end

    def project_owner
      unless (@project.user_id == current_user.id)
        flash[:notice] = 'NO'
        redirect_to root_path
      end
    end
end
