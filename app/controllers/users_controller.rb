class UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  def show
    is_matching_login_user
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    is_matching_login_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all 
      render :index
    end
  end


  private

  #ストパラ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to home_path
    end
  end
end
