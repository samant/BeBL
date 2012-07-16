class ProjectsController < ApplicationController
  
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  def index
    @projects = @projects.order(sort_order('projects.name', 'down')).page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @project.save
      flash[:notice] = "Project successfully created !"
      redirect_to projects_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project successfully updated !"
      redirect_to projects_path
    else
      render :edit
    end
  end
  
  def destroy
    if @project.destroy
      flash[:notice] = "Project successfully destroyed !"
      redirect_to projects_path
    else
      redirect_to projects_path, :notice => "#{@project.errors[:base].to_s}"
    end
  end
  
end