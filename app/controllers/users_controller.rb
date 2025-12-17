class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def show 
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit

  end
end
