class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  def index
    @users = @users.order(sort_order('users.name', 'down')).page(params[:page]).per(10)
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "User successfully updated !"
      redirect_to users_path
    else
      render :edit
    end
  end
  
  def destroy
    if @user.destroy
      flash[:notice] = "User successfully destroyed !"
      redirect_to users_path
    else
      redirect_to users_path, :notice => "#{@user.errors[:base].to_s}"
    end
  end
  
end