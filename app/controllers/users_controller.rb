class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :destroy]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Account created successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Please try again"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end  
  
end
