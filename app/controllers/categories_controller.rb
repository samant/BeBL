class CategoriesController < ApplicationController
  
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  def index
    @type = params[:type] || "all"
    @categories = Category.by_type(@type).order(sort_order('categories.name', 'down')).page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @category.save
      flash[:notice] = "Category successfully created !"
      redirect_to categories_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category successfully updated !"
      redirect_to categories_path
    else
      render :edit
    end
  end
  
  def destroy
    if @category.destroy
      flash[:notice] = "Category successfully destroyed !"
      redirect_to categories_path
    else
      redirect_to categories_path, :notice => "#{@category.errors[:base].to_s}"
    end
  end
  
end