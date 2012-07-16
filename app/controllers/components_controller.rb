class ComponentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  def index
    @type = params[:type] || "all"
    @components = Component.by_type(@type).order(sort_order('components.name', 'down')).page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @component.save
      flash[:notice] = "Component successfully created !"
      redirect_to components_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @component.update_attributes(params[:component])
      flash[:notice] = "Component successfully updated !"
      redirect_to components_path
    else
      render :edit
    end
  end
  
  def destroy
    if @component.destroy
      flash[:notice] = "Component successfully destroyed !"
      redirect_to components_path
    else
      redirect_to components_path, :notice => "#{@component.errors[:base].to_s}"
    end
  end
  
end